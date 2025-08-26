import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:lazu_tree/app/app.dart';
import 'package:lazu_tree/app/core/env/env_impl.dart';
import 'package:lazu_tree/app/core/firebase/firebase_options.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  // use Path url strategy
  usePathUrlStrategy();

  // initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Enable Firestore offline persistence for web
  if (kIsWeb) {
    final env = EnvImpl();
    if (env.firestoreDatabase.isNotEmpty) {
      FirebaseFirestore.instance
        ..settings = const Settings(
          persistenceEnabled: true,
          cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
        )
        ..databaseId = env.firestoreDatabase;
    } else {
      // use default database
      FirebaseFirestore.instance
        ..settings = const Settings(
          persistenceEnabled: true,
          cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
        )
        ..databaseId = '(default)';
    }
  }

  // initialize hydrated bloc (web only for now)
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory.web,
  );

  // run App
  runApp(const App());
}
