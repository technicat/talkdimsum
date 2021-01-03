/*
 Technicat LLC 
 Entry point for Talk Dim Sum
*/

//import 'dart:io' show Platform;

import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;

import 'core/country.dart';
import 'core/dimsum.dart';
import 'core/tags.dart';
import 'core/phrases.dart';

import 'ui/myapp.dart';

//import 'ui/material/mymaterialapp.dart';
void main() async {
  // needed for accessing rootBundle for JSON
  WidgetsFlutterBinding.ensureInitialized();
  await Country.loadList();
  await DimSum.load();
  await Tags.load();
  await Phrases.load();
  runApp(MyApp());
  /*
  try {
    if (Platform.isIOS || Platform.isMacOS) {
      runApp(MyCupertinoApp());
    } else {
      runApp(MyMaterialApp());
    }
  } catch (e) {
    // Platform breaks on the web
    runApp(MyMaterialApp());
  } */
}
