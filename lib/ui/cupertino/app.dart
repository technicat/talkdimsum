/*
 Technicat LLC 
 Entry point for Talk Dim Sum
*/

import 'package:flutter/cupertino.dart';

import 'navigation_bar.dart';

import 'router.gr.dart';

class App extends StatelessWidget {

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      onGenerateRoute: _appRouter,
      title: 'Talk Dim Sum',
      builder: (BuildContext context, Widget widget) => NavigationBar(),
    );
  }
}
