/*
 Technicat LLC 
 Entry point for Talk Dim Sum
*/

import 'package:flutter/cupertino.dart';

import 'navigationbar.dart';


class MyCupertinoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Talk Dim Sum',
      home: NavigationBar(),
    );
  }
}
