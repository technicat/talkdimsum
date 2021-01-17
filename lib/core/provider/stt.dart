import 'package:flutter/foundation.dart' show ChangeNotifier;

import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

import 'package:talkdimsum/core/model/language.dart';
import 'package:talkdimsum/core/model/word.dart';

enum STTStatus {
  NotListening,
  Listening,
  Match,
  Mismatch,
  Timeout,
  Error,
  Stopped
}


class STT with ChangeNotifier {
  final SpeechToText speech = SpeechToText();

  STTStatus status = STTStatus.NotListening;

  String lastWords = "";
  String lastError = "";
  String lastStatus = "";

  String target = "";

  Future listen(Word word, Chinese lang) async {
    lastWords = "";
    target = word.chineseText(lang);
    bool available = await speech.initialize(
        onStatus: _statusListener, onError: _errorListener);
    if (available) {
      status = STTStatus.NotListening;
      speech.listen(
          onResult: _resultListener,
          listenFor: Duration(seconds: 10),
          localeId: Language.locale(lang),
          onSoundLevelChange: _soundLevelListener,
          cancelOnError: true,
          partialResults: true);
    } else {
      print("The user has denied the use of speech recognition.");
    }
  }

  _stop() {
    speech.stop();
  }

  stop() {
    status = STTStatus.Stopped;
    _stop();
  }

  void _resultListener(SpeechRecognitionResult result) {
      lastWords = "${result.recognizedWords}"; //  - ${result.finalResult}";
      if (lastWords == target) {
        status = STTStatus.Match;
        _stop();
      }
      if (!target.startsWith(lastWords)) {
        status = STTStatus.Mismatch;
        _stop();
      }
  }

  void _errorListener(SpeechRecognitionError error) {
    // print("Received error status: $error, listening: ${speech.isListening}");
      lastError = "${error.errorMsg} - ${error.permanent}";
      notifyListeners();
  }

  void _statusListener(String status) {
    // print(
    // "Received listener status: $status, listening: ${speech.isListening}");
      lastStatus = "$status";
      notifyListeners();
  }

  void _soundLevelListener(double level) {
    // print("sound level $level: $minSoundLevel - $maxSoundLevel ");
  }
}

