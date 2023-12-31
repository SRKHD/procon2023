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
    apiKey: 'AIzaSyCMMF3X0t_x2Y_mlQK4YTotufEkl2wKAQ4',
    appId: '1:809481648215:web:4d712afec4b9643a0a8b12',
    messagingSenderId: '809481648215',
    projectId: 'flutter-sampe-20231124',
    authDomain: 'flutter-sampe-20231124.firebaseapp.com',
    storageBucket: 'flutter-sampe-20231124.appspot.com',
    measurementId: 'G-80YDTSK2LF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyChrnjf5jnv0P-eeFSaOA-3l1yW8EMHCDs',
    appId: '1:809481648215:android:23533008e6bcecf10a8b12',
    messagingSenderId: '809481648215',
    projectId: 'flutter-sampe-20231124',
    storageBucket: 'flutter-sampe-20231124.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAE51MCm7403Ul_6ubqA25F6ryiItAXzew',
    appId: '1:809481648215:ios:31efbbfa28d315490a8b12',
    messagingSenderId: '809481648215',
    projectId: 'flutter-sampe-20231124',
    storageBucket: 'flutter-sampe-20231124.appspot.com',
    iosBundleId: 'com.example.firebaseSample02',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAE51MCm7403Ul_6ubqA25F6ryiItAXzew',
    appId: '1:809481648215:ios:b235f0fe2d5b5d7c0a8b12',
    messagingSenderId: '809481648215',
    projectId: 'flutter-sampe-20231124',
    storageBucket: 'flutter-sampe-20231124.appspot.com',
    iosBundleId: 'com.example.firebaseSample02.RunnerTests',
  );
}
