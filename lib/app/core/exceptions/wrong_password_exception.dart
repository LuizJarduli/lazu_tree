import 'package:lazu_tree/app/core/exceptions/app_exception.dart';

final class WrongPasswordException extends AppException {
  const WrongPasswordException([StackTrace? stackTrace])
    : super('Wrong password', stackTrace);

  @override
  String toString() => 'WrongPasswordException: $message';
}
