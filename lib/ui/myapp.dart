/*
 Technicat LLC 
*/
import 'dart:io' show Platform;

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/dimsum.dart';
import 'package:talkdimsum/core/country.dart';

import 'cupertino/mycupertinoapp.dart';
import 'material/mymaterialapp.dart';

// https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget app;
    try {
      if (Platform.isIOS || Platform.isMacOS) {
        app = MyCupertinoApp();
      } else {
        app = MyMaterialApp();
      }
    } catch (e) {
      // Platform breaks on the web
      app = MyMaterialApp();
    }
    // should use multiprovider
    return MultiProvider(providers: [
      ChangeNotifierProvider<DimSum>(create: (context) => DimSum()),
      ChangeNotifierProvider<Countries>(create: (context) => Countries())
    ], child: app);
  }
}
