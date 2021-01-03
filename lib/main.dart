/*
 Technicat LLC 
 Entry point for Talk Dim Sum
*/

import 'package:flutter/widgets.dart' show WidgetsFlutterBinding, runApp;

import 'core/country.dart';
import 'core/dimsum.dart';
import 'core/tags.dart';
import 'core/phrases.dart';

import 'ui/myapp.dart';

void main() async {
  // needed for accessing rootBundle for JSON
  WidgetsFlutterBinding.ensureInitialized();
  await Country.loadList();
  await DimSum.load();
  await Tags.load();
  await Phrases.load();
  runApp(MyApp());
}
