import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import 'navigation_bar.dart';

//import '../common/localization.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetCupertinoApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates, /*[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate, 
        ] , */
        supportedLocales: AppLocalizations.supportedLocales, /* [
          const Locale('en', ''), // English, no country code
          const Locale('es', ''), // Spanish, no country code
        ], */

      //  translations: Localization(), // your translations
      //  locale: Get.deviceLocale,
      //  fallbackLocale: Locale('en', 'US'), //
        home: NavigationBar(),
        title: 'Talk Dim Sum', //AppLocalizations.of(context)!.talkdimsum, // 'title', // .tr,
      );
}
