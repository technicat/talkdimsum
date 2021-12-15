/*
 Technicat LLC 
 Material design version of Talk Dim Sum
*/

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import 'navigationbar.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        home: MyNavigationBar(),
        //https://flutter.dev/docs/development/accessibility-and-localization/internationalization

        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,

        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context)!.talkdimsum,
      );
}
