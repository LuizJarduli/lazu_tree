part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

final class LoginInitial extends LoginState {
  const LoginInitial();
}

final class LoginLoading extends LoginState {
  const LoginLoading();
}

final class LoginSuccess extends LoginState {
  const LoginSuccess({this.redirectUrl});

  final String? redirectUrl;

  @override
  List<Object?> get props => [redirectUrl];
}

final class LoginError extends LoginState {
  const LoginError(this.errorMessage, this.additionalMessage);

  final String errorMessage;

  final String additionalMessage;

  @override
  List<Object?> get props => [errorMessage, additionalMessage];
}
