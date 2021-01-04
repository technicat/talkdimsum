/*
 Technicat LLC 
 Entry point for Talk Dim Sum
*/

import 'package:flutter/widgets.dart' show WidgetsFlutterBinding, runApp;

//import 'core/country.dart';
//import 'core/dimsum.dart';
//import 'core/tags.dart';

import 'ui/myapp.dart';

void main() async {
  // needed for accessing rootBundle for JSON
  WidgetsFlutterBinding.ensureInitialized();
//  await DimSum.loadDishes();
 // await DimSum.loadCategories();
 // await Tags.load();
  runApp(MyApp());
}
