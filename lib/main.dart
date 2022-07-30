/*
 Technicat LLC 
 Entry point for Talk Dim Sum
*/

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/provider/settings.dart';
import 'package:talkdimsum/core/provider/stt.dart';
import 'package:talkdimsum/core/provider/tts.dart';

import 'ui/cupertino/app.dart' as cupertino;
import 'ui/material/app.dart' as material;
import 'ui/mac/app.dart' as macos;

void main() async {
  runApp(riverpod.ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget app;
    if (GetPlatform.isIOS) {
      app = cupertino.App();
    } else if (GetPlatform.isMacOS) {
      app = macos.App();
    } else {
      app = material.App();
    }
    return MultiProvider(providers: [
      ChangeNotifierProvider<Settings>(create: (context) => Settings()),
      ChangeNotifierProvider<STT>(create: (context) => STT()),
      ChangeNotifierProvider<TTS>(create: (context) => TTS())
    ], child: app);
  }
}
