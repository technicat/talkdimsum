/*
 Technicat LLC 
 Entry point for Talk Dim Sum
*/

// directory structure is similar to
// https://github.com/jgrandchavin/flutter_provider_architecture_starter

import 'package:flutter/widgets.dart' show runApp;

import 'ui/myapp.dart';

void main() async {
  // needed for accessing rootBundle for JSON
 // WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
