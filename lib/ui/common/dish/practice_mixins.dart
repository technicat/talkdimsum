import 'package:speech_to_text/speech_to_text.dart';

import 'package:talkdimsum/core/util/settings.dart';

abstract class STTState {
  final SpeechToText speech = SpeechToText();

  String lastWords = "";
  String lastError = "";
  String lastStatus = "";
}

abstract class TTSState {
  double speed = Settings.speed;
  Chinese lang = Settings.language;
}
