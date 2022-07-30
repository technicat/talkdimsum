/*
 Technicat LLC 
 Material design version of Talk Dim Sum
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navigationbar.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        theme: ThemeData.light().copyWith(useMaterial3: true),
        home: MyNavigationBar(),
        onGenerateTitle: (BuildContext context) => 'Talk Dim Sum',
      );
}
