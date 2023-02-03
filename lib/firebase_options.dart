// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyCW4WseFkXfRTOfefiLifd30uB0rpPyynk',
    appId: '1:213235290414:web:af71494434d223ef98eabf',
    messagingSenderId: '213235290414',
    projectId: 'flutterfirestore1-468b5',
    authDomain: 'flutterfirestore1-468b5.firebaseapp.com',
    storageBucket: 'flutterfirestore1-468b5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLW-HI2x0vrzCBy14Fghz_SngmCWHwpO0',
    appId: '1:213235290414:android:d0a42a3faaa8713298eabf',
    messagingSenderId: '213235290414',
    projectId: 'flutterfirestore1-468b5',
    storageBucket: 'flutterfirestore1-468b5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAj6FVXrjvrxivM1lNQR3lpKOxeBktNPlI',
    appId: '1:213235290414:ios:e19c78d7329f6ced98eabf',
    messagingSenderId: '213235290414',
    projectId: 'flutterfirestore1-468b5',
    storageBucket: 'flutterfirestore1-468b5.appspot.com',
    iosBundleId: 'com.example.flutterFirestore1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAj6FVXrjvrxivM1lNQR3lpKOxeBktNPlI',
    appId: '1:213235290414:ios:e19c78d7329f6ced98eabf',
    messagingSenderId: '213235290414',
    projectId: 'flutterfirestore1-468b5',
    storageBucket: 'flutterfirestore1-468b5.appspot.com',
    iosBundleId: 'com.example.flutterFirestore1',
  );
}