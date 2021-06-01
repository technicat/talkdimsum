/* Technicat LLC */
//import 'dart:io' show Platform;

import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import 'package:talkdimsum/core/model/language.dart';
import 'package:talkdimsum/core/model/word.dart';

class TTS {
  static FlutterTts flutterTts = FlutterTts();

  static Future _say(String text, Chinese lang, double speed) async {
    try {
      // Platform check fails on web
      if (GetPlatform.isIOS || GetPlatform.isMacOS) {
        await flutterTts
            .setSpeechRate(speed * 0.35); // tts plays back fast on ios
      } else {
        await flutterTts.setSpeechRate(speed * 0.8);
      }
    } catch (e) {
      await flutterTts.setSpeechRate(speed);
    }
    // language change not working on iOS
    // need to call setVoice?
    // List<dynamic> languages = await flutterTts.getLanguages;
    // print(languages);
    var loc = Language.locale(lang);
    await flutterTts.setLanguage(loc);
    //await flutterTts.setVoice({"locale": loc});
    var result = await flutterTts.speak(text);
    if (result == 1) {
      print('speaking ' + loc);
    } else {
      print("didn't speak for some reason");
    }
  }

  static Future say(Word word, Chinese lang, double speed) async {
    await _say(word.chineseText(lang), lang, speed);
  }

  /*
  flutterTts.setStartHandler(() {
  setState(() {
    ttsState = TtsState.playing;
  });
});

flutterTts.setCompletionHandler(() {
  setState(() {
    ttsState = TtsState.stopped;
  });
});

flutterTts.setProgressHandler((String text, int startOffset, int endOffset, String word) {
  setState(() {
    _currentWord = word;
  });
});

flutterTts.setErrorHandler((msg) {
  setState(() {
    ttsState = TtsState.stopped;
  });
});

flutterTts.setCancelHandler((msg) {
  setState(() {
    ttsState = TtsState.stopped;
  });
});

// iOS and Web
flutterTts.setPauseHandler((msg) {
  setState(() {
    ttsState = TtsState.paused;
  });
});

flutterTts.setContinueHandler((msg) {
  setState(() {
    ttsState = TtsState.continued;
  });
});
*/
}
