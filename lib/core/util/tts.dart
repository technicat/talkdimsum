/* Technicat LLC */

import 'dart:io' show Platform;

import 'package:flutter_tts/flutter_tts.dart';

import 'package:talkdimsum/core/model/language.dart';
import 'package:talkdimsum/core/model/word.dart';

//import '../provider/settings.dart';

// rename to TTS
class Speech {
  static FlutterTts flutterTts = FlutterTts();

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

  static Future sayText(String text, Chinese lang, double speed) async {
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
    // language change not working on iOS
    // need to call setVoice?
    // List<dynamic> languages = await flutterTts.getLanguages;
    // print(languages);
    var loc = locale(lang);
    await flutterTts.setLanguage(loc);
    //await flutterTts.setVoice({"locale": loc});
    var result = await flutterTts.speak(text);
    if (result == 1) {
      print("speaking " + loc);
    } else {
      print("didn't speak for some reason");
    }
  }

  static Future sayWord(Word word, Chinese lang, double speed) async {
    await sayText(word.chineseText(lang), lang, speed);
  }
}
