/* Technicat LLC */

import 'package:get/get.dart';

class Language {
// this could be a Map
  static String locale(Chinese lang) {
    if (GetPlatform.isIOS || GetPlatform.isMacOS) {
      switch (lang) {
        case Chinese.cantonese:
          return 'zh-HK';
        case Chinese.mandarin:
          return 'zh-TW';
        case Chinese.simplified:
          return 'zh-CN';
        default:
          return 'zh-HK';
      }
    }
    if (GetPlatform.isAndroid) {
      switch (lang) {
        case Chinese.cantonese:
          return 'yue-HK';
        case Chinese.mandarin:
          return 'zh-TW';
        case Chinese.simplified:
          return 'zh-CN';
        default:
          return 'yue-HK';
      }
    }
    if (GetPlatform.isWindows) {
      switch (lang) {
        case Chinese.cantonese:
          return 'zh-HK';
        case Chinese.mandarin:
          return 'zh-TW';
        case Chinese.simplified:
          return 'zh-CN';
        default:
          return 'zh-HK';
      }
    }
    // https://www.metamodpro.com/browser-language-codes
    if (GetPlatform.isWeb) {
      switch (lang) {
        case Chinese.cantonese:
          return 'zh-hk';
        case Chinese.mandarin:
          return 'zh-tw';
        case Chinese.simplified:
          return 'zh-cn';
        default:
          return 'zh-hk';
      }
    }
    switch (lang) {
      case Chinese.cantonese:
        return 'zh-hk';
      case Chinese.mandarin:
        return 'zh-tw';
      case Chinese.simplified:
        return 'zh-cn';
      default:
        return 'zh-hk';
    }
  }
}

enum Chinese {
  cantonese,
  mandarin,
  simplified,
}
