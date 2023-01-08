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
    apiKey: 'AIzaSyD1h2INS7OE7jsVGasQBz-fSwUiK-HXa_o',
    appId: '1:314086732361:web:c02574054cd979ee6f4598',
    messagingSenderId: '314086732361',
    projectId: 'student-media-taufeeq',
    authDomain: 'student-media-taufeeq.firebaseapp.com',
    storageBucket: 'student-media-taufeeq.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_UXCLGdi91MgdW0O34NUWwETFL-aldQc',
    appId: '1:314086732361:android:3003bb08cfa725a36f4598',
    messagingSenderId: '314086732361',
    projectId: 'student-media-taufeeq',
    storageBucket: 'student-media-taufeeq.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1rzxa5ck0MjdDFhGDb1aBpJvKi_XaBTs',
    appId: '1:314086732361:ios:50b7c09f0fd120916f4598',
    messagingSenderId: '314086732361',
    projectId: 'student-media-taufeeq',
    storageBucket: 'student-media-taufeeq.appspot.com',
    iosClientId: '314086732361-nnulvr1d6r35abtb1afo50urnmi2dqi4.apps.googleusercontent.com',
    iosBundleId: 'com.example.studentMediaFirebase',
  );
}