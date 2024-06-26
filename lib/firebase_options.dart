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
    apiKey: 'AIzaSyAF5cyAvrvMhwbLJqFi8EvU6SysgnqRQZI',
    appId: '1:786905406587:web:ecd831d866a0d1cfc916de',
    messagingSenderId: '786905406587',
    projectId: 'telechat-852c3',
    authDomain: 'telechat-852c3.firebaseapp.com',
    storageBucket: 'telechat-852c3.appspot.com',
    measurementId: 'G-EQBR0TQQT9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmYI5YBKF_hSJ7fp71BY2M_hirjOKdMVw',
    appId: '1:786905406587:android:71f6f52a6f8a74d9c916de',
    messagingSenderId: '786905406587',
    projectId: 'telechat-852c3',
    storageBucket: 'telechat-852c3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANH1LmrJIs0KbZjPVTcOqkRI_l_DXCLbM',
    appId: '1:786905406587:ios:a7ff0c47ea15c73cc916de',
    messagingSenderId: '786905406587',
    projectId: 'telechat-852c3',
    storageBucket: 'telechat-852c3.appspot.com',
    iosBundleId: 'com.example.telechat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANH1LmrJIs0KbZjPVTcOqkRI_l_DXCLbM',
    appId: '1:786905406587:ios:cb871d36561ddb3bc916de',
    messagingSenderId: '786905406587',
    projectId: 'telechat-852c3',
    storageBucket: 'telechat-852c3.appspot.com',
    iosBundleId: 'com.example.telechat.RunnerTests',
  );
}
