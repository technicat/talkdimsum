import 'package:flutter/foundation.dart' show ChangeNotifier;

import 'package:flutter_tts/flutter_tts.dart';

import 'package:talkdimsum/core/model/language.dart';
import 'package:talkdimsum/core/model/word.dart';

class TTS with ChangeNotifier {
  FlutterTts flutterTts = FlutterTts();

  //String uttering = '';

  Future _say(String text, Chinese lang, double speed) async {
    await flutterTts.setSpeechRate(speed * 0.5);
    if (flutterTts.progressHandler == null) {
      flutterTts
          .setProgressHandler((String text, int start, int end, String word) {
        // uttering = word;
      });
    }
    var loc = Language.locale(lang);
    await flutterTts.setLanguage(loc);
    var result = await flutterTts.speak(text);
    if (result == 1) {
      //print('speaking in ' + loc);
    } else {
      print("didn't speak for some reason");
    }
  }

  Future say(Word word, Chinese lang, double speed) async {
    await _say(word.chineseText(lang), lang, speed);
  }
}
