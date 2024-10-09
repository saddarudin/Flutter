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
    apiKey: 'AIzaSyCz29m5lNc2IbJCphyUUAK8ZB_CDr3jZXw',
    appId: '1:185632624856:web:1522f7a8393def350d07ad',
    messagingSenderId: '185632624856',
    projectId: 'mad-class-work',
    authDomain: 'mad-class-work.firebaseapp.com',
    storageBucket: 'mad-class-work.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-Qj-HJoei5u8mJRljlIfFGetel6fr8VE',
    appId: '1:185632624856:android:4738a659421bb5ff0d07ad',
    messagingSenderId: '185632624856',
    projectId: 'mad-class-work',
    storageBucket: 'mad-class-work.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQnM_xukx3PeY9vyUb7txi6lbRIRkkRaA',
    appId: '1:185632624856:ios:efecacfc064b78b30d07ad',
    messagingSenderId: '185632624856',
    projectId: 'mad-class-work',
    storageBucket: 'mad-class-work.appspot.com',
    iosBundleId: 'com.example.firebaseExample',
  );
}