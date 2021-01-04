/*
 Technicat LLC 
*/
import 'dart:io' show Platform;

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/dimsum.dart';

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
    // should use multiprovider
    return ChangeNotifierProvider<DimSum>( //      <--- ChangeNotifierProvider
      create: (context) => DimSum(),
      child: 
     /* Consumer<DimSum>(builder: (context, dimsum, child) {
        dimsum.loadDimSum();
        dimsum.loadPhrases();
        dimsum.loadCountries(); */
        app
     // })
    );
  }
}
