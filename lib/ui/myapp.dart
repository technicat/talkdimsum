/*
 Technicat LLC 
*/

// https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple

import 'dart:io' show Platform;

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/core/provider/favorites.dart';
import 'package:talkdimsum/core/provider/conversation.dart';
import 'package:talkdimsum/core/provider/countries.dart';

import 'cupertino/mycupertinoapp.dart';
import 'material/mymaterialapp.dart';

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
    return MultiProvider(providers: [
      ChangeNotifierProvider<DimSum>(create: (context) => DimSum()),
       ChangeNotifierProvider<Favorites>(create: (context) => Favorites()),
      ChangeNotifierProvider<Countries>(create: (context) => Countries()),
      ChangeNotifierProvider<Conversation>(create: (context) => Conversation())
    ], child: app);
  }
}
