import 'package:flutter/cupertino.dart';

//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';


import 'navigation_bar.dart';
import 'router.gr.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
  //  registerNotifications();
    return CupertinoApp(
      onGenerateRoute: _appRouter,
      title: 'Talk Dim Sum',
      builder: (BuildContext context, Widget widget) => NavigationBar(),
    );
  }
}

