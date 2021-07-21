import 'package:flutter/foundation.dart' show ChangeNotifier;

import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import 'package:talkdimsum/core/model/language.dart';
import 'package:talkdimsum/core/model/word.dart';

class TTS with ChangeNotifier {
  FlutterTts flutterTts = FlutterTts();

  String uttering = '';

  Future _say(String text, Chinese lang, double speed) async {
    if (GetPlatform.isIOS || GetPlatform.isMacOS) {
      await flutterTts
          .setSpeechRate(speed * 0.35); // tts plays back fast on ios
    } else {
      await flutterTts.setSpeechRate(speed * 0.8);
    }
    if (flutterTts.progressHandler == null) {
      flutterTts.setProgressHandler(
          (String text, int start, int end, String word) {
            uttering = word;
          });
    }
    // language change not always working on iOS
    // need to call setVoice?
    // List<dynamic> languages = await flutterTts.getLanguages;
    // print(languages);
    var loc = Language.locale(lang);
    await flutterTts.setLanguage(loc);
    //await flutterTts.setVoice({"locale": loc});
    var result = await flutterTts.speak(text);
    if (result == 1) {
      print('speaking in ' + loc);
    } else {
      print("didn't speak for some reason");
    }
  }

  Future say(Word word, Chinese lang, double speed) async {
    await _say(word.chineseText(lang), lang, speed);
  }

}
