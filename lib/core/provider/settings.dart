/* Technicat LLC */

import 'package:flutter/foundation.dart' show ChangeNotifier;

import 'package:shared_preferences/shared_preferences.dart';

class Settings with ChangeNotifier {

  SharedPreferences prefs;

  Settings() {
    _load();
  }

  _load() async {
    prefs = await SharedPreferences.getInstance();
  }

  Chinese _language = Chinese.Cantonese;
  
  Chinese get language {
    return _language;
    //return Chinese.values[prefs.getInt('language')];
  }

  set language(Chinese language) {
    _language = language;
    notifyListeners();
    //prefs.setInt('language',language.index);
  }

  double _speed = 0.5;

   double get speed {
     return _speed;
    //return prefs.getDouble('speed');
  }

  set speed(double speed) {
    _speed = speed;
    notifyListeners();
    //prefs.setDouble('speed',speed);
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

enum Chinese {
  Cantonese,
  Mandarin,
  Simplified,
}
