/*
 Technicat LLC 
 Entry point for Talk Dim Sum
*/

// directory structure is similar to
// https://github.com/jgrandchavin/flutter_provider_architecture_starter

// https://blog.logrocket.com/flutter-push-notifications-with-firebase-cloud-messaging/

import 'dart:io' show Platform;

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:talkdimsum/core/provider/settings.dart';
import 'package:talkdimsum/core/provider/stt.dart';

import 'ui/cupertino/app.dart' as cupertino;
import 'ui/material/app.dart' as material;

void main() async {
  runApp(riverpod.ProviderScope(child: MainApp()));
}

// wrapper around the native (cupertino or material) versions
// set up change notifier providers here for app state
// https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget app;
    try {
      if (Platform.isIOS || Platform.isMacOS) {
//        registerNotifications();
        app = cupertino.App();
      } else {
        app = material.App();
      }
    } catch (e) {
      // Platform check above breaks on web
      app = material.App();
    }
    return MultiProvider(providers: [
      //    ChangeNotifierProvider<DimSum>(create: (context) => DimSum()),
//      ChangeNotifierProvider<Countries>(create: (context) => Countries()),
//      ChangeNotifierProvider<Conversation>(create: (context) => Conversation()),
      ChangeNotifierProvider<Settings>(create: (context) => Settings()),
      ChangeNotifierProvider<STT>(create: (context) => STT())
    ], child: app);
  }
}

// https://firebase.flutter.dev/docs/messaging/usage
void registerNotifications() async {
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
    String? token = await messaging.getToken();
    print(token);
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }

  // FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);

  // print('User granted permission: ${settings.authorizationStatus}');
}
