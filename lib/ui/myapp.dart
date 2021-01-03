/*
 Technicat LLC 
*/
import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import 'cupertino/mycupertinoapp.dart';
import 'material/mymaterialapp.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    try {
      if (Platform.isIOS || Platform.isMacOS) {
        return MyCupertinoApp();
      } else {
        return MyMaterialApp();
      }
    } catch (e) {
      // Platform breaks on the web
      return MyMaterialApp();
    }
  }
}
