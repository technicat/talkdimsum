import 'package:flutter/foundation.dart' show ChangeNotifier;

import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
//import 'package:speech_to_text/speech_recognition_result.dart';

import 'package:talkdimsum/core/model/language.dart';


class STT with ChangeNotifier {
  final SpeechToText speech = SpeechToText();

  String lastWords = "";
  String lastError = "";
  String lastStatus = "";

  Future listen(Chinese lang) async {
    lastWords = "";
    bool available = await speech.initialize(
        onStatus: statusListener, onError: errorListener);
    if (available) {
      speech.listen(
         // onResult: resultListener,
          listenFor: Duration(seconds: 10),
          localeId: Language.locale(lang),
          onSoundLevelChange: soundLevelListener,
          cancelOnError: true,
          partialResults: true);
    } else {
      print("The user has denied the use of speech recognition.");
    }
  }

  stopListening() {
    speech.stop();
  }

 /* void resultListener(SpeechRecognitionResult result) {
      lastWords = "${result.recognizedWords}"; //  - ${result.finalResult}";
      if (lastWords == widget.word.chineseText(lang)) {
        stopListening();
      }
      if (!widget.word.chineseText(lang).startsWith(lastWords)) {
        stopListening();
      }
  } */

  void errorListener(SpeechRecognitionError error) {
    // print("Received error status: $error, listening: ${speech.isListening}");
      lastError = "${error.errorMsg} - ${error.permanent}";
  }

  void statusListener(String status) {
    // print(
    // "Received listener status: $status, listening: ${speech.isListening}");
      lastStatus = "$status";
  }

  void soundLevelListener(double level) {
    /* minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    // print("sound level $level: $minSoundLevel - $maxSoundLevel ");
    setState(() {
      this.level = level;
    }); */
  }
}

