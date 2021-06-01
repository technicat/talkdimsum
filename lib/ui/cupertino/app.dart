import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import 'navigation_bar.dart';

import '../common/localization.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetCupertinoApp(
        translations: Localization(), // your translations
        locale:
            Locale('en', 'US'), // translations will be displayed in that locale
        fallbackLocale: Locale('en', 'UK'), //
        home: NavigationBar(),
        title: 'Talk Dim Sum',
      );
}
