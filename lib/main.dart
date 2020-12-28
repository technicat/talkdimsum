/*
 Technicat LLC 
 Entry point for Talk Dim Sum
*/

import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import 'core/country.dart';
import 'core/dimsum.dart';
import 'core/tags.dart';
import 'core/phrases.dart';

import 'material/myapp.dart';
import 'cupertino/myapp.dart';

void main() async {
  // needed for accessing rootBundle for JSON
  WidgetsFlutterBinding.ensureInitialized();
  await Country.loadList();
  await DimSum.load();
  await Tags.load();
  await Phrases.load();
  try {
    // Plastform breaks on the web
    if (Platform.isIOS || Platform.isMacOS) {
      runApp(MyCupertinoApp());
    } else {
      runApp(MyMaterialApp());
    }
  } catch (e) {
    runApp(MyMaterialApp());
  }
}
