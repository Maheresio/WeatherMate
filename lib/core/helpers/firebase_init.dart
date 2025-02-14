import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

import '../../firebase_options.dart';

Future<void> firebaseInit() async {
  if (!Platform.isLinux) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
