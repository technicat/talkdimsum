import 'package:flutter/cupertino.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// https://github.com/FirebaseExtended/flutterfire/issues/2088

//import 'package:overlay_support/overlay_support.dart';

import 'navigation_bar.dart';
import 'router.gr.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    registerNotifications();
    return CupertinoApp(
      onGenerateRoute: _appRouter,
      title: 'Talk Dim Sum',
      builder: (BuildContext context, Widget widget) => NavigationBar(),
    );
  }

  void registerNotifications() {
    Firebase.initializeApp();
    FirebaseMessaging _messaging = FirebaseMessaging();
    _messaging.requestNotificationPermissions(IosNotificationSettings(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    ));
    _messaging.configure(
      onMessage: (message) async {
        print('onMessage received: $message');

        //   PushNotification notification = PushNotification.fromJson(message);

        /*   setState(() {
          _notificationInfo = notification;
          _totalNotifications++;
        }); */

        // For displaying the notification as an overlay
        /*   showSimpleNotification(
          Text(_notificationInfo.title),
          leading: NotificationBadge(totalNotifications: _totalNotifications),
          subtitle: Text(_notificationInfo.body),
          background: Colors.cyan[700],
          duration: Duration(seconds: 2),
        ); */
      },
      onBackgroundMessage: _firebaseMessagingBackgroundHandler,
      onLaunch: (message) async {
        print('onLaunch: $message');

        //   PushNotification notification = PushNotification.fromJson(message);

        /*     setState(() {
          _notificationInfo = notification;
          _totalNotifications++;
        }); */
      },
      onResume: (message) async {
        print('onResume: $message');

        //  PushNotification notification = PushNotification.fromJson(message);

        /*     setState(() {
          _notificationInfo = notification;
          _totalNotifications++;
        }); */
      },
    );

    // Used to get the current FCM token
    _messaging.getToken().then((token) {
      print('Token: $token');
    }).catchError((e) {
      print(e);
    });
  }
}

//   String token = await messaging.getToken();
//   print("FirebaseMessaging token: $token");
/*
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
} else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
  print('User granted provisional permission');
} else {
  print('User declined or has not accepted permission');
} */

class PushNotification {
  PushNotification({
    this.title,
    this.body,
    this.dataTitle,
    this.dataBody,
  });

  String title;
  String body;
  String dataTitle;
  String dataBody;

  factory PushNotification.fromJson(Map<String, dynamic> json) {
    return PushNotification(
      title: json["notification"]["title"],
      body: json["notification"]["body"],
      dataTitle: json["data"]["title"],
      dataBody: json["data"]["body"],
    );
  }
}

Future<dynamic> _firebaseMessagingBackgroundHandler(
  Map<String, dynamic> message,
) async {
  // Initialize the Firebase app
  await Firebase.initializeApp();
  print('onBackgroundMessage received: $message');
}
/*
class NotificationBadge extends StatelessWidget {
  final int totalNotifications;

  const NotificationBadge({@required this.totalNotifications});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: new BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$totalNotifications',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
} */
