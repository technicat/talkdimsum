/*
 Technicat LLC 
 Entry point for Talk Dim Sum
*/

import 'package:flutter/material.dart';

import 'core/country.dart';
import 'core/dimsum.dart';
import 'core/tags.dart';
import 'core/phrases.dart';

import 'ui/myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // needed for accessing rootBundle for JSON
  await Country.loadList();
	await DimSum.load();
  await Tags.load();
  await Phrases.load();
  runApp(MyApp());
}

