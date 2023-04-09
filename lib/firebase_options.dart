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
    apiKey: 'AIzaSyAp_WZ0XMs0TG3K8fvtE1wHoQ8bcWfTz_8',
    appId: '1:370071791167:web:59ada194334ea99d6a3a8a',
    messagingSenderId: '370071791167',
    projectId: 'music-app-flutter-letansang',
    authDomain: 'music-app-flutter-letansang.firebaseapp.com',
    storageBucket: 'music-app-flutter-letansang.appspot.com',
    measurementId: 'G-RT2JRGS0VK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAyWf15RSg_pHD9SrB38mmyIDesYvSzBb8',
    appId: '1:370071791167:android:349baae178b3dfdf6a3a8a',
    messagingSenderId: '370071791167',
    projectId: 'music-app-flutter-letansang',
    storageBucket: 'music-app-flutter-letansang.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB5tXQab01WfFZT8EGdhgOhGpnCgl2ufqA',
    appId: '1:370071791167:ios:8ef3eaa063ddb1b36a3a8a',
    messagingSenderId: '370071791167',
    projectId: 'music-app-flutter-letansang',
    storageBucket: 'music-app-flutter-letansang.appspot.com',
    iosClientId: '370071791167-tlpvvkai4b9hlfncdssof3rfrqfo6ojb.apps.googleusercontent.com',
    iosBundleId: 'com.example.musicAppFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB5tXQab01WfFZT8EGdhgOhGpnCgl2ufqA',
    appId: '1:370071791167:ios:8ef3eaa063ddb1b36a3a8a',
    messagingSenderId: '370071791167',
    projectId: 'music-app-flutter-letansang',
    storageBucket: 'music-app-flutter-letansang.appspot.com',
    iosClientId: '370071791167-tlpvvkai4b9hlfncdssof3rfrqfo6ojb.apps.googleusercontent.com',
    iosBundleId: 'com.example.musicAppFlutter',
  );
}
