// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDQUzURY_29HpQ4wAr_gHulbUGOGHPt5hg',
    appId: '1:575317137829:web:0f8220a51b67de6ee6f04c',
    messagingSenderId: '575317137829',
    projectId: 'weathermate-9164c',
    authDomain: 'weathermate-9164c.firebaseapp.com',
    storageBucket: 'weathermate-9164c.firebasestorage.app',
    measurementId: 'G-CVE8TJM6FV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBM4JbzJ4jNwKqAGzcAEAsbeSnW47NcGs4',
    appId: '1:575317137829:android:8f84828136917e86e6f04c',
    messagingSenderId: '575317137829',
    projectId: 'weathermate-9164c',
    storageBucket: 'weathermate-9164c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA8N3ZsxnzIY95arT5ct7jXEeuwHIjVeco',
    appId: '1:575317137829:ios:65991b6ea880cc46e6f04c',
    messagingSenderId: '575317137829',
    projectId: 'weathermate-9164c',
    storageBucket: 'weathermate-9164c.firebasestorage.app',
    iosBundleId: 'com.example.weatherMate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA8N3ZsxnzIY95arT5ct7jXEeuwHIjVeco',
    appId: '1:575317137829:ios:65991b6ea880cc46e6f04c',
    messagingSenderId: '575317137829',
    projectId: 'weathermate-9164c',
    storageBucket: 'weathermate-9164c.firebasestorage.app',
    iosBundleId: 'com.example.weatherMate',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDQUzURY_29HpQ4wAr_gHulbUGOGHPt5hg',
    appId: '1:575317137829:web:2b41e10f67e75d78e6f04c',
    messagingSenderId: '575317137829',
    projectId: 'weathermate-9164c',
    authDomain: 'weathermate-9164c.firebaseapp.com',
    storageBucket: 'weathermate-9164c.firebasestorage.app',
    measurementId: 'G-XVKC0B67LN',
  );

}