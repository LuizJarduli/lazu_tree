import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazu_tree/app/core/logger/logger.dart';
import 'package:lazu_tree/app/features/auth/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository, this._logger) : super(const LoginInitial());

  final AuthRepository _authRepository;

  final Logger _logger;

  Future<void> loginWithEmail(String email, String password) async {
    emit(const LoginLoading());

    try {
      await _authRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(const LoginSuccess());
    } on Exception catch (error, stackTrace) {
      _logger.error(
        'Login failed with email: $email',
        error,
        stackTrace,
      );

      emit(
        LoginError(
          'Não foi possível fazer login com o email: $email',
          'Tente novamente mais tarde.',
        ),
      );
    }
  }

  Future<void> loginWithGoogle() async {
    emit(const LoginLoading());

    try {
      await _authRepository.signInWithGoogle();
      emit(const LoginSuccess());
    } on Exception catch (error, stackTrace) {
      _logger.error(
        'Login failed with Google',
        error,
        stackTrace,
      );

      emit(
        const LoginError(
          'Não foi possível fazer login com o Google',
          'Tente novamente mais tarde.',
        ),
      );
    }
  }

  void reset() {
    emit(const LoginInitial());
  }
}
