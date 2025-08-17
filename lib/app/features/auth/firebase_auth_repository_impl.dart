import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lazu_tree/app/core/exceptions/exceptions.dart';
import 'package:lazu_tree/app/core/firebase/firebase_collections.dart';
import 'package:lazu_tree/app/features/auth/auth_repository.dart';
import 'package:lazu_tree/app/features/link_tree/models/app_user.dart';

class FirebaseAuthRepositoryImpl implements AuthRepository {
  const FirebaseAuthRepositoryImpl(this._firebaseAuth, this._firebaseFirestore);

  final FirebaseAuth _firebaseAuth;

  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error, stackTrace) {
      final exception = switch (error.code) {
        'user-not-found' => UserNotFoundException(stackTrace),
        'wrong-password' => WrongPasswordException(stackTrace),
        _ => Exception('Failed to sign in: ${error.message}'),
      };

      throw exception;
    } catch (error) {
      throw Exception('Failed to sign in: $error');
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      final provider =
          GoogleAuthProvider()
            ..addScope('https://www.googleapis.com/auth/contacts.readonly')
            ..setCustomParameters({'login_hint': 'usuário@domínio.com.br'});

      await _firebaseAuth.signInWithRedirect(provider);
      final userCred = await _firebaseAuth.getRedirectResult();
      final user = userCred.user;
      final userDoc =
          await _firebaseFirestore
              .collection(FirebaseCollections.users)
              .doc(user?.uid)
              .get();

      if (!userDoc.exists) {
        await _createAccountFromGoogle(user!);
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-disabled') {
        throw ProvidedUserDisabled(StackTrace.current);
      }
      rethrow;
    } catch (error) {
      throw Exception('Failed to sign in: $error');
    }
  }

  @override
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }

  @override
  Future<void> resetPassword(String email) {
    // TODO(lugalokinho): implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> sendEmailVerification(String email) {
    // TODO(lugalokinho): implement sendEmailVerification
    throw UnimplementedError();
  }

  @override
  Future<bool> completeSignInWithRedirect() async {
    try {
      final userCred = await _firebaseAuth.getRedirectResult();
      final user = userCred.user;

      if (user == null) return false;

      final userDoc =
          await _firebaseFirestore
              .collection(FirebaseCollections.users)
              .doc(user.uid)
              .get();

      if (!userDoc.exists) {
        await _createAccountFromGoogle(user);
      }

      return true;
    } catch (error) {
      throw Exception('Failed to handle redirect sign in: $error');
    }
  }

  Future<DocumentReference> _createAccountFromGoogle(User user) async {
    try {
      final User(:uid, :displayName, :email, :phoneNumber, :photoURL) = user;

      final appUser = AppUser(
        id: uid,
        name: displayName ?? email ?? 'usuário $uid',
        email: email!,
        phone: phoneNumber,
        image: photoURL,
        linkSections: const [],
        socialLinks: const [],
      );

      return _firebaseFirestore
          .collection(FirebaseCollections.users)
          .add(appUser.toMap());
    } catch (error) {
      throw Exception('Failed to create user from sign in: $error');
    }
  }
}
