import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter/services.dart';

import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

import 'package:talkdimsum/core/model/language.dart';
import 'package:talkdimsum/core/model/word.dart';

enum STTStatus {
  notListening,
  listening,
  match,
  mismatch,
  timeout,
  error,
  stopped
}

class STT with ChangeNotifier {
  final SpeechToText _speech = SpeechToText();

  STTStatus status = STTStatus.notListening;

  String lastWords = '';
  String lastError = '';
  String lastStatus = '';

  String target = '';

  bool _initialized = false;

  Future listen(Word word, Chinese lang) async {
    lastWords = '';
    target = word.chineseText(lang);
    if (!_initialized) {
      try {
        _initialized = await _speech.initialize(
            onStatus: _statusListener,
            onError: _errorListener,
            debugLogging: true,
            options: [SpeechToText.androidIntentLookup]);
      } on PlatformException catch (e) {
        print(e.message);
        status = STTStatus.error;
        lastError = e.message ?? 'platform error';
        notifyListeners();
        return;
      }
    }
    if (_initialized) {
      status = STTStatus.listening;
      await _speech.listen(
          onResult: _resultListener,
          listenFor: Duration(seconds: 10),
          localeId: Language.locale(lang),
          //    onSoundLevelChange: _soundLevelListener,
          cancelOnError: true,
          partialResults: true);
    } else {
      lastError = 'Speech recognition not initialized';
      print('The user has denied the use of speech recognition.');
    }
    notifyListeners();
  }

  void stop() {
    status = STTStatus.stopped;
    _speech.stop();
    notifyListeners();
  }

  void _resultListener(SpeechRecognitionResult result) {
    lastWords = result.recognizedWords; //  - ${result.finalResult}";
    if (lastWords == target) {
      status = STTStatus.match;
      _speech.stop();
    }
    if (!target.startsWith(lastWords)) {
      status = STTStatus.mismatch;
      _speech.stop();
    }
    notifyListeners();
  }

  void _errorListener(SpeechRecognitionError error) {
    //print("speech recognition error: $error");
    // if (error.permanent) {
    //  _speech.cancel();
    status = STTStatus.error;
    switch (error.errorMsg) {
      // Android
      case 'error_audio_error':
        lastError = 'audio error';
        break;
      case 'error_client':
        lastError = 'client error';
        break;
      case 'error_permission':
        lastError = 'permission not granted';
        break;
      case 'error_network':
        lastError = 'network error';
        break;
      case 'error_network_timeout':
        lastError = 'network timed out';
        break;
      case 'error_no_match':
        lastError = 'no match found';
        break;
      case 'error_server':
        lastError = 'server error';
        break;
      case 'error_speech_timeout':
        lastError = 'timed out';
        break;
      default:
        lastError = error.errorMsg;
    }
    notifyListeners();
    //}
  }

  void _statusListener(String status) {
    // print(
    // "Received listener status: $status, listening: ${speech.isListening}");
    lastStatus = status;
    notifyListeners();
  }

  // void _soundLevelListener(double level) {
  // print("sound level $level: $minSoundLevel - $maxSoundLevel ");
  // }
}
