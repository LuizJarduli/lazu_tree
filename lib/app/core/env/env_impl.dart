import 'package:lazu_tree/app/core/env/env.dart';

sealed class _EnvKeys {
  static const String firestoreDatabaseKey = 'FIRESTORE_DATABASE';
}

class EnvImpl implements Env {
  @override
  String get firestoreDatabase =>
      const String.fromEnvironment(_EnvKeys.firestoreDatabaseKey);
}
