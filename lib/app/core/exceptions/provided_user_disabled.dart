import 'package:lazu_tree/app/core/exceptions/exceptions.dart';

final class ProvidedUserDisabled extends AppException {
  const ProvidedUserDisabled([StackTrace? stackTrace])
    : super('The current user has been disabled', stackTrace);

  @override
  String toString() => 'ProvidedUserDisabled: $message';
}
