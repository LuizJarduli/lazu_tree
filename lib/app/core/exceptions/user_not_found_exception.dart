import 'package:lazu_tree/app/core/exceptions/app_exception.dart';

final class UserNotFoundException extends AppException {
  const UserNotFoundException([StackTrace? stackTrace])
    : super('User not found', stackTrace);

  @override
  String toString() => 'UserNotFoundException: $message';
}
