import 'package:speech_to_text/speech_to_text.dart';
//import 'package:speech_to_text/speech_recognition_error.dart';
//import 'package:speech_to_text/speech_recognition_result.dart';

//import 'package:talkdimsum/core/model/word.dart';
//import 'package:talkdimsum/core/util/speech.dart';
import 'package:talkdimsum/core/util/settings.dart';

class STTState {
  final SpeechToText speech = SpeechToText();

  String lastWords = "";
  String lastError = "";
  String lastStatus = "";
}

class TTSState {
  double speed = Settings.speed;
  Chinese lang = Settings.language;
}
