/* Technicat LLC */

import 'package:flutter/foundation.dart' show ChangeNotifier;

import 'package:shared_preferences/shared_preferences.dart';

import 'package:talkdimsum/core/model/language.dart';

class Settings with ChangeNotifier {

  SharedPreferences prefs;

  Settings() {
    _load();
  }

  _load() async {
    prefs = await SharedPreferences.getInstance();
    language = Chinese.values[prefs.getInt('language')] ?? Chinese.Cantonese;
    speed = prefs.getDouble('speed') ?? 0.5;
  }

  Chinese _language = Chinese.Cantonese;
  
  Chinese get language {
    return _language;
  }

  set language(Chinese language) {
    _language = language;
    notifyListeners();
    prefs.setInt('language',language.index);
  }

  double _speed = 0.5;

   double get speed {
     return _speed;
  }

  set speed(double speed) {
    _speed = speed;
    notifyListeners();
    prefs.setDouble('speed',speed);
  }

  String languageName(Chinese language) {
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

}
