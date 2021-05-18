/* Technicat LLC */

//import 'dart:io' show Platform;

import 'package:get/get.dart';

class Language {
// this could be a Map
  static String locale(Chinese lang) {
//    try {
      if (GetPlatform.isIOS || GetPlatform.isMacOS) {
        switch (lang) {
          case Chinese.Cantonese:
            return 'zh-HK';
          case Chinese.Mandarin:
            return 'zh-TW';
          case Chinese.Simplified:
            return 'zh-CN';
          default:
            return 'zh-HK';
        }
      }
      if (GetPlatform.isAndroid) {
        switch (lang) {
          case Chinese.Cantonese:
            return 'yue-HK';
          case Chinese.Mandarin:
            return 'zh-TW';
          case Chinese.Simplified:
            return 'zh-CN';
          default:
            return 'yue-HK';
        }
      }
      if (GetPlatform.isWindows) {
        switch (lang) {
          case Chinese.Cantonese:
            return 'zh-HK';
          case Chinese.Mandarin:
            return 'zh-TW';
          case Chinese.Simplified:
            return 'zh-CN';
          default:
            return 'zh-HK';
        }
      }
     // https://www.metamodpro.com/browser-language-codes
      if (GetPlatform.isWeb) {
        switch (lang) {
          case Chinese.Cantonese:
            return 'zh-hk';
          case Chinese.Mandarin:
            return 'zh-tw';
          case Chinese.Simplified:
            return 'zh-cn';
          default:
            return 'zh-hk';
        }
      }
  /*  } catch (e) {
       // Platform checks fail on web
      print('Platform check failed');
    } */
    switch (lang) {
      case Chinese.Cantonese:
        return 'zh-hk';
      case Chinese.Mandarin:
        return 'zh-tw';
      case Chinese.Simplified:
        return 'zh-cn';
      default:
        return 'zh-hk';
    }
  }
}


enum Chinese {
  Cantonese,
  Mandarin,
  Simplified,
}
