/*
 Technicat LLC 
 Entry point for Talk Dim Sum
*/

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:get/get.dart';
import 'package:provider/provider.dart';
//import 'package:window_size/window_size.dart';

import 'package:talkdimsum/core/provider/settings.dart';
import 'package:talkdimsum/core/provider/stt.dart';
import 'package:talkdimsum/core/provider/tts.dart';

import 'ui/cupertino/app.dart' as cupertino;
import 'ui/material/app.dart' as material;

void main() async {
  runApp(riverpod.ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget app;
    if (GetPlatform.isDesktop) {
//      setWindowFrame(Rect.fromLTRB(0,0,600,800));
    }
    if (GetPlatform.isIOS || GetPlatform.isMacOS) {
      app = cupertino.App();
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
