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
  final SpeechToText _speech = SpeechToText();

  STTStatus _status = STTStatus.NotListening;

  STTStatus get status {
    return _status;
  }

  String lastWords = '';
  String lastError = '';
  String lastStatus = '';

  String target = '';

  Future listen(Word word, Chinese lang) async {
    lastWords = '';
    target = word.chineseText(lang);
    final available = await _speech.initialize(
        onStatus: _statusListener, onError: _errorListener);
    if (available) {
      _status = STTStatus.Listening;
      await _speech.listen(
          onResult: _resultListener,
          listenFor: Duration(seconds: 10),
          localeId: Language.locale(lang),
          //    onSoundLevelChange: _soundLevelListener,
          cancelOnError: true,
          partialResults: true);
    } else {
      print('The user has denied the use of speech recognition.');
    }
    notifyListeners();
  }

  void stop() {
    _status = STTStatus.Stopped;
    _speech.stop();
    notifyListeners();
  }

  void _resultListener(SpeechRecognitionResult result) {
    lastWords = '${result.recognizedWords}'; //  - ${result.finalResult}";
    if (lastWords == target) {
      _status = STTStatus.Match;
      _speech.stop();
    }
    if (!target.startsWith(lastWords)) {
      _status = STTStatus.Mismatch;
      _speech.stop();
    }
    notifyListeners();
  }

  void _errorListener(SpeechRecognitionError error) {
   // print("Received error status: $error, listening: ${speech.isListening}");
    _status = STTStatus.Error;
    lastError = '${error.errorMsg} - ${error.permanent}';
    notifyListeners();
  }

  void _statusListener(String status) {
    // print(
    // "Received listener status: $status, listening: ${speech.isListening}");
    lastStatus = '$status';
    notifyListeners();
  }

  // void _soundLevelListener(double level) {
  // print("sound level $level: $minSoundLevel - $maxSoundLevel ");
  // }
}
