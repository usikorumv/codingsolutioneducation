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
    apiKey: 'AIzaSyCGAC4DrrJvI4tpmExUE6UNnBFXspRI0MI',
    appId: '1:1000195572808:web:66070044f708d59734847d',
    messagingSenderId: '1000195572808',
    projectId: 'codingsolutionedu-b4282',
    authDomain: 'codingsolutionedu-b4282.firebaseapp.com',
    databaseURL: 'https://codingsolutionedu-b4282-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'codingsolutionedu-b4282.appspot.com',
    measurementId: 'G-D53PS0GVPF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOmAo5e53ElOmQ_3GH9dnP5SrQSVk_3Ag',
    appId: '1:1000195572808:android:15f26aaba2cb336234847d',
    messagingSenderId: '1000195572808',
    projectId: 'codingsolutionedu-b4282',
    databaseURL: 'https://codingsolutionedu-b4282-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'codingsolutionedu-b4282.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBpYjRwltS5FNZSnYW9v_df1QHUME9RvMc',
    appId: '1:1000195572808:ios:35fc0abe6d5169fb34847d',
    messagingSenderId: '1000195572808',
    projectId: 'codingsolutionedu-b4282',
    databaseURL: 'https://codingsolutionedu-b4282-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'codingsolutionedu-b4282.appspot.com',
    iosClientId: '1000195572808-g3mgage2qcfmjvkfqno1rdg8o2j5hrfo.apps.googleusercontent.com',
    iosBundleId: 'com.example.usCourse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBpYjRwltS5FNZSnYW9v_df1QHUME9RvMc',
    appId: '1:1000195572808:ios:35fc0abe6d5169fb34847d',
    messagingSenderId: '1000195572808',
    projectId: 'codingsolutionedu-b4282',
    databaseURL: 'https://codingsolutionedu-b4282-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'codingsolutionedu-b4282.appspot.com',
    iosClientId: '1000195572808-g3mgage2qcfmjvkfqno1rdg8o2j5hrfo.apps.googleusercontent.com',
    iosBundleId: 'com.example.usCourse',
  );
}