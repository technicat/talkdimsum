/*
 Technicat LLC 
 Material design version of Talk Dim Sum
*/

import 'package:flutter/material.dart';

import 'navigationbar.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talk Dim Sum',
      theme: ThemeData.light(),
      home: NavigationBar(),
    );
  }
}
