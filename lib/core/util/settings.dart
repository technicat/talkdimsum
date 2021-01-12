/* Technicat LLC */

import 'package:flutter/foundation.dart' show ChangeNotifier;

import 'package:shared_preferences/shared_preferences.dart';

class Settings with ChangeNotifier {
  static load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = Chinese.values[prefs.getInt('language')];
    speed = prefs.getDouble('speed');
  }

  static Chinese language = Chinese.Cantonese;

  static double speed = 1.0;

  static String languageName(Chinese language) {
    switch (language) {
      case Chinese.Cantonese:
        return "Cantonese";
      case Chinese.Mandarin:
        return "Mandarin";
      case Chinese.Simplified:
        return "Simplified";
      default:
        return "Cantonese";
    }
  }

  static int languageNum(Chinese language) {
    switch (language) {
      case Chinese.Cantonese:
        return 0;
      case Chinese.Mandarin:
        return 1;
      case Chinese.Simplified:
        return 2;
      default:
        return 0;
    }
  }

  static Chinese fromNum(int num) {
    switch (num) {
      case 0:
        return Chinese.Cantonese;
      case 1:
        return Chinese.Mandarin;
      case 2:
        return Chinese.Simplified;
      default:
        return Chinese.Cantonese;
    }
  }
}

enum Chinese {
  Cantonese,
  Mandarin,
  Simplified,
}
