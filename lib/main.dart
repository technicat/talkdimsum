/*
 Technicat LLC 
 Entry point for Talk Dim Sum
*/

// directory structure is similar to
// https://github.com/jgrandchavin/flutter_provider_architecture_starter

import 'dart:io' show Platform;

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/core/provider/conversation.dart';
import 'package:talkdimsum/core/provider/countries.dart';
import 'package:talkdimsum/core/provider/settings.dart';

import 'ui/cupertino/app.dart' as cupertino;
import 'ui/material/app.dart' as material;

void main() async {
  runApp(MainApp());
}

// wrapper around the native (cupertino or material) versions
// set up change notifier providers here for app state
// https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple

class MainApp extends StatelessWidget {
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
      ChangeNotifierProvider<Countries>(create: (context) => Countries()),
      ChangeNotifierProvider<Conversation>(create: (context) => Conversation()),
      ChangeNotifierProvider<Settings>(create: (context) => Settings())
    ], child: app);
  }
}
