import 'package:lazu_tree/app/features/auth/auth_repository.dart';

class FirebaseAuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    // TODO(lugalokinho): Implement Firebase email/password sign in
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithGoogle() async {
    // TODO(lugalokinho): Implement Firebase Google sign in
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithApple() async {
    // TODO(lugalokinho): Implement Firebase Apple sign in
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO(lugalokinho): implement signOut
    throw UnimplementedError();
  }
}
