/* Technicat LLC */

import 'dart:io' show Platform;

class Language {
// this could be a Map
// move to Language
  static String locale(Chinese lang) {
    try {
      // Platform checks fail on web
      if (Platform.isIOS || Platform.isMacOS) {
        switch (lang) {
          case Chinese.Cantonese:
            return "zh-HK";
          case Chinese.Mandarin:
            return "zh-TW";
          case Chinese.Simplified:
            return "zh-CN";
          default:
            return "zh-HK";
        }
      }
      if (Platform.isAndroid) {
        switch (lang) {
          case Chinese.Cantonese:
            return "yue-HK";
          case Chinese.Mandarin:
            return "zh-TW";
          case Chinese.Simplified:
            return "zh-CN";
          default:
            return "yue-HK";
        }
      }
      if (Platform.isWindows) {
        switch (lang) {
          case Chinese.Cantonese:
            return "zh-HK";
          case Chinese.Mandarin:
            return "zh-TW";
          case Chinese.Simplified:
            return "zh-CN";
          default:
            return "zh-HK";
        }
      }
    } catch (e) {
      print("Platform check failed");
    }
    switch (lang) {
      case Chinese.Cantonese:
        return "zh-hk";
      case Chinese.Mandarin:
        return "zh-tw";
      case Chinese.Simplified:
        return "zh-cn";
      default:
        return "zh-hk";
    }
  }
}


enum Chinese {
  Cantonese,
  Mandarin,
  Simplified,
}
