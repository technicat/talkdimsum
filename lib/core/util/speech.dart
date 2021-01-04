/* Technicat LLC */

import 'dart:io' show Platform;

import 'package:flutter_tts/flutter_tts.dart';

import 'settings.dart';
import '../model/word.dart';

class Speech {
  static FlutterTts flutterTts = FlutterTts();

  static String locale(Language lang) {
    try {
      // Platform checks fail on web
      if (Platform.isIOS || Platform.isMacOS) {
        switch (lang) {
          case Language.Cantonese:
            return "zh-HK";
          case Language.Mandarin:
            return "zh-Hant";
          case Language.Simplified:
            return "zh-Hans";
          default:
            return "zh-HK";
        }
      }
      if (Platform.isAndroid) {
        switch (lang) {
          case Language.Cantonese:
            return "yue-HK";
          case Language.Mandarin:
            return "zh-TW";
          case Language.Simplified:
            return "zh-CN";
          default:
            return "yue-HK";
        }
      }
      if (Platform.isWindows) {
        switch (lang) {
          case Language.Cantonese:
            return "zh-HK";
          case Language.Mandarin:
            return "zh-TW";
          case Language.Simplified:
            return "zh-CN";
          default:
            return "zh-HK";
        }
      }
    } catch (e) {
      print("Platform check failed");
    }
    switch (lang) {
      case Language.Cantonese:
        return "zh-hk";
      case Language.Mandarin:
        return "zh-tw";
      case Language.Simplified:
        return "zh-cn";
      default:
        return "zh-hk";
    }
  }

  static Future sayText(String text, Language lang, double speed) async {
    try {
      // Platform check fails on web
      if (Platform.isIOS || Platform.isMacOS) {
        await flutterTts
            .setSpeechRate(speed / 2.0); // tts plays back fast on ios
      } else {
        await flutterTts.setSpeechRate(speed);
      }
    } catch (e) {
      await flutterTts.setSpeechRate(speed);
    }
    await flutterTts.setLanguage(locale(lang));
    var result = await flutterTts.speak(text);
    if (result == 1) {
      print("speaking...");
    } else {
      print("didn't speak for some reason");
    }
  }

  static Future sayWord(Word word, Language lang, double speed) async {
    await sayText(word.chineseText(lang), lang, speed);
  }
}
