import 'package:lazu_tree/app/core/exceptions/exceptions.dart';

final class UnauthorizedException extends AppException {
  const UnauthorizedException([StackTrace? stackTrace])
    : super(
        'Unauthorized action',
        stackTrace,
      );

  @override
  String toString() => 'UnauthorizedException: $message';
}
