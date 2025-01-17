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
    apiKey: 'AIzaSyBcDQtwtpB857PP6t40jHTbIVnfja1a6YA',
    appId: '1:951735932381:web:adefe4921a10c88ce41234',
    messagingSenderId: '951735932381',
    projectId: 'coindock-2a85f',
    authDomain: 'coindock-2a85f.firebaseapp.com',
    storageBucket: 'coindock-2a85f.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0tE3P6S027TYkCCr-6URgPd-YsHVBmik',
    appId: '1:951735932381:android:8a5a5e93bf148c6ae41234',
    messagingSenderId: '951735932381',
    projectId: 'coindock-2a85f',
    storageBucket: 'coindock-2a85f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBpj_PlpbUKtLyj6PqwbFxIcKg8TKGQIjA',
    appId: '1:951735932381:ios:e2a8377a7e377ca8e41234',
    messagingSenderId: '951735932381',
    projectId: 'coindock-2a85f',
    storageBucket: 'coindock-2a85f.firebasestorage.app',
    iosClientId: '951735932381-6se7d8l4a9kflvd11vllkmbjphoit4nl.apps.googleusercontent.com',
    iosBundleId: 'com.example.coindockApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBpj_PlpbUKtLyj6PqwbFxIcKg8TKGQIjA',
    appId: '1:951735932381:ios:e2a8377a7e377ca8e41234',
    messagingSenderId: '951735932381',
    projectId: 'coindock-2a85f',
    storageBucket: 'coindock-2a85f.firebasestorage.app',
    iosClientId: '951735932381-6se7d8l4a9kflvd11vllkmbjphoit4nl.apps.googleusercontent.com',
    iosBundleId: 'com.example.coindockApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBcDQtwtpB857PP6t40jHTbIVnfja1a6YA',
    appId: '1:951735932381:web:0ae5b06d27859d24e41234',
    messagingSenderId: '951735932381',
    projectId: 'coindock-2a85f',
    authDomain: 'coindock-2a85f.firebaseapp.com',
    storageBucket: 'coindock-2a85f.firebasestorage.app',
  );

}