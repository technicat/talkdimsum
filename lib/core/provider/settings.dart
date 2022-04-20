/* Technicat LLC */

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talkdimsum/core/model/language.dart';

class Settings with ChangeNotifier {
  late final SharedPreferences prefs;

  Settings() {
    _load();
  }

  void _load() async {
    prefs = await SharedPreferences.getInstance();
    language =
        Chinese.values[prefs.getInt('language') ?? Chinese.cantonese.index];
    speed = prefs.getDouble('speed') ?? 0.5;
  }

  Chinese _language = Chinese.cantonese;

  Chinese get language => _language;

  set language(Chinese language) {
    _language = language;
    notifyListeners();
    prefs.setInt('language', language.index);
  }

  double _speed = 0.5;

  double get speed => _speed;

  set speed(double speed) {
    _speed = speed;
    notifyListeners();
    prefs.setDouble('speed', speed);
  }

  String languageName(Chinese language) => describeEnum(language);
}
