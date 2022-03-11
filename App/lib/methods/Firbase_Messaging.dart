import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';

class PushManager {
  static final PushManager _manager = PushManager._internal();
  final _firebaseMessaging = FirebaseMessaging();
  factory PushManager() {
    return _manager;
  }

  PushManager._internal() {
    // 초기화 코드
  }

  void _requestIOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true)
    );

    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings)
    {
      print("Settings registered: $settings");
    });
  }

  void registerToken() {
    if (Platform.isIOS) {
      _requestIOSPermission();
    }

    _firebaseMessaging.getToken().then((token) {
      print(token);
      // 장고 서버에 token알려주기
    });
  }

  void listenFirebaseMessaging() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        // Triggered if a message is received whilst the app is in foreground
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        // Triggered if a message is received whilst the app is in background
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        // Triggered if a message is received if the app was terminated
        print('on launch $message');
      },
    );
  }
}