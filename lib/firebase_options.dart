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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDq8_WJiiz1G-CWJ7C6wfQs9J4qcgS5428',
    appId: '1:1079547207648:web:8cc93bbd6b6ea2e8aed585',
    messagingSenderId: '1079547207648',
    projectId: 'portfolio-489-1',
    authDomain: 'portfolio-489-1.firebaseapp.com',
    storageBucket: 'portfolio-489-1.firebasestorage.app',
    measurementId: 'G-2P5FXCX7VK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAF2LjTyWzCaupE5bloz39_ypSnTxng88w',
    appId: '1:1079547207648:android:09c3cf68188647baaed585',
    messagingSenderId: '1079547207648',
    projectId: 'portfolio-489-1',
    storageBucket: 'portfolio-489-1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC505hbNStwf6A4f5uQdpvyzAoACUhoO0c',
    appId: '1:1079547207648:ios:4505d4fb1ae544f8aed585',
    messagingSenderId: '1079547207648',
    projectId: 'portfolio-489-1',
    storageBucket: 'portfolio-489-1.firebasestorage.app',
    iosBundleId: 'KoustavK.com.myPortfolio',
  );

}