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
    apiKey: 'AIzaSyDzXn16GZCNbtBdZ8oCt2m0fI0CAjZ_0Dc',
    appId: '1:831709560001:web:bc32ff022d4bd282f52840',
    messagingSenderId: '831709560001',
    projectId: 'coding-658e2',
    authDomain: 'coding-658e2.firebaseapp.com',
    storageBucket: 'coding-658e2.appspot.com',
    measurementId: 'G-FV5213JEVE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOIQaE5PvOPSPrrYTVpQKJwhYk20FwRBI',
    appId: '1:831709560001:android:ceadc1770702b531f52840',
    messagingSenderId: '831709560001',
    projectId: 'coding-658e2',
    storageBucket: 'coding-658e2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDuwN9gmMJMxYQ55xhAiwBZy4hzFnl4300',
    appId: '1:831709560001:ios:1939232c79ff2444f52840',
    messagingSenderId: '831709560001',
    projectId: 'coding-658e2',
    storageBucket: 'coding-658e2.appspot.com',
    iosClientId: '831709560001-n65upiu1op4t5oprdvo8masmb19pftnl.apps.googleusercontent.com',
    iosBundleId: 'com.example.usCourse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDuwN9gmMJMxYQ55xhAiwBZy4hzFnl4300',
    appId: '1:831709560001:ios:3fb24f09913e59b7f52840',
    messagingSenderId: '831709560001',
    projectId: 'coding-658e2',
    storageBucket: 'coding-658e2.appspot.com',
    iosClientId: '831709560001-ej00re6hh4g78s0auq9s5bhbrhcjdro9.apps.googleusercontent.com',
    iosBundleId: 'com.example.codingsolutionedu',
  );
}
