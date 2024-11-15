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
    apiKey: 'AIzaSyBfq-qoj7lfHFn1fc0U_N8SvJtZePBGA4I',
    appId: '1:865869490847:web:52811b60792beb811ad0aa',
    messagingSenderId: '865869490847',
    projectId: 'boros2',
    authDomain: 'boros2.firebaseapp.com',
    storageBucket: 'boros2.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgH3NPTRgK78ExHjcSZ--wSCsBg_0uKjQ',
    appId: '1:865869490847:android:eb3fa74e7e92a1221ad0aa',
    messagingSenderId: '865869490847',
    projectId: 'boros2',
    storageBucket: 'boros2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhJTcC2LjHk1awtkQ-YgcBuCXZ42J3AQ0',
    appId: '1:865869490847:ios:6471ec9ef27898a61ad0aa',
    messagingSenderId: '865869490847',
    projectId: 'boros2',
    storageBucket: 'boros2.firebasestorage.app',
    iosBundleId: 'com.example.serverTest2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAhJTcC2LjHk1awtkQ-YgcBuCXZ42J3AQ0',
    appId: '1:865869490847:ios:6471ec9ef27898a61ad0aa',
    messagingSenderId: '865869490847',
    projectId: 'boros2',
    storageBucket: 'boros2.firebasestorage.app',
    iosBundleId: 'com.example.serverTest2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBfq-qoj7lfHFn1fc0U_N8SvJtZePBGA4I',
    appId: '1:865869490847:web:7c9b61c2295945391ad0aa',
    messagingSenderId: '865869490847',
    projectId: 'boros2',
    authDomain: 'boros2.firebaseapp.com',
    storageBucket: 'boros2.firebasestorage.app',
  );
}
