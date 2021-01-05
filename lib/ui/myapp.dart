/*
 Technicat LLC 
*/

// wrapper around the native (cupertino or material) versions
// set up change notifier providers here for app state
// https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple

import 'dart:io' show Platform;

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/core/provider/favorites.dart';
import 'package:talkdimsum/core/provider/conversation.dart';
import 'package:talkdimsum/core/provider/countries.dart';

import 'cupertino/app.dart' as cupertino;
import 'material/app.dart' as material;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget app;
    try {
      if (Platform.isIOS || Platform.isMacOS) {
        app = cupertino.App();
      } else {
        app = material.App();
      }
    } catch (e) {
      // Platform check above breaks on web
      app = material.App();
    }
    return MultiProvider(providers: [
      ChangeNotifierProvider<DimSum>(create: (context) => DimSum()),
      ChangeNotifierProvider<Favorites>(create: (context) => Favorites()),
      ChangeNotifierProvider<Countries>(create: (context) => Countries()),
      ChangeNotifierProvider<Conversation>(create: (context) => Conversation())
    ], child: app);
  }
}
