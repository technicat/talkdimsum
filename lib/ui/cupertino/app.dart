import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import 'navigation_bar.dart';

import '../common/localization.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetCupertinoApp(
        translations: Localization(), // your translations
        locale: Get.deviceLocale,
        fallbackLocale: Locale('en', 'US'), //
        home: NavigationBar(),
        title: 'title'.tr,
      );
}
