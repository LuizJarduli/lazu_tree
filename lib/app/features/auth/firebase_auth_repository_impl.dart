import 'package:firebase_auth/firebase_auth.dart';
import 'package:lazu_tree/app/core/exceptions/exceptions.dart';
import 'package:lazu_tree/app/features/auth/auth_repository.dart';

class FirebaseAuthRepositoryImpl implements AuthRepository {
  const FirebaseAuthRepositoryImpl(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

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
    // TODO(lugalokinho): Implement Firebase Google sign in
    throw UnimplementedError();
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
}
