import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import 'navigation_bar.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetCupertinoApp(
        home: MyNavigationBar(),
        //https://flutter.dev/docs/development/accessibility-and-localization/internationalization

        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,

        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context)!.talkdimsum,
      );
}
