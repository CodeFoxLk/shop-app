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
    apiKey: 'AIzaSyA3B2VF2NX9IyrUdQfZWGdAdeJhQpTAiAk',
    appId: '1:850933442768:web:da3743d06d2a98789296d5',
    messagingSenderId: '850933442768',
    projectId: 'shop-app-b2bfd',
    authDomain: 'shop-app-b2bfd.firebaseapp.com',
    storageBucket: 'shop-app-b2bfd.appspot.com',
    measurementId: 'G-9WP0SVKBWE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZ_rEY0ObbZ5hwzk2MzP-lR16jsfKQNUM',
    appId: '1:850933442768:android:064af32c0bfb81e69296d5',
    messagingSenderId: '850933442768',
    projectId: 'shop-app-b2bfd',
    storageBucket: 'shop-app-b2bfd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAT6Jm3SDGavohk83xL8qiJ7Dokn0U_KTc',
    appId: '1:850933442768:ios:ce7cf20c4e8f7d679296d5',
    messagingSenderId: '850933442768',
    projectId: 'shop-app-b2bfd',
    storageBucket: 'shop-app-b2bfd.appspot.com',
    iosClientId: '850933442768-6db4t6e13r3l3fg5627vorao4fm77fmp.apps.googleusercontent.com',
    iosBundleId: 'com.codefox.shopApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAT6Jm3SDGavohk83xL8qiJ7Dokn0U_KTc',
    appId: '1:850933442768:ios:5a44e092386229be9296d5',
    messagingSenderId: '850933442768',
    projectId: 'shop-app-b2bfd',
    storageBucket: 'shop-app-b2bfd.appspot.com',
    iosClientId: '850933442768-gj7rme95g1jr9qnd4m3v2213gbtdokdb.apps.googleusercontent.com',
    iosBundleId: 'com.example.shopApp',
  );
}
