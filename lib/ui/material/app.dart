/*
 Technicat LLC 
 Material design version of Talk Dim Sum
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navigationbar.dart';
import '../common/localization.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Get.deviceLocale);
    return GetMaterialApp(
      translations: Localization(), // your translations
      locale: Get.deviceLocale,
      //     Locale('en', 'US'), // translations will be displayed in that locale
      fallbackLocale: Locale('en', 'UK'), //
      title: 'title'.tr,
      //  theme: ThemeData.light(),
      home: NavigationBar(),
    );
  }
}
