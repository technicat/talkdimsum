import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/core/util/tts.dart';
import 'package:talkdimsum/core/provider/settings.dart';

import 'package:talkdimsum/core/provider/stt.dart';

class STTWidget extends StatefulWidget with STTState {
  final Word word;

  STTWidget({Key key, @required this.word}) : super(key: key);

  @override
  STTWidgetState createState() => STTWidgetState();
}

class STTWidgetState extends State<STTWidget> with STTState {
  @override
  Widget build {
    return
           Consumer<Settings>(builder: (context, settings, child) {
          return if (lastWords == widget.word.chineseText(settings.language))
            Text('You got it!',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
          if (!widget.word.chineseText(settings.language).startsWith(lastWords))
            Text('Wrong!',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24))
           
          Text('$lastWords',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
          Spacer(),
          speech.isListening
              ? CupertinoButton(
                  child: Icon(CupertinoIcons.pause),
                  // tooltip: 'Stop listening',
                  onPressed: () {
                    stopListening();
                  },
                )
              : CupertinoButton(
                  child: Icon(CupertinoIcons.mic),
                  //  tooltip: 'Practice saying this word',
                  onPressed: () {
                    listen(settings.language);
                  },
                )
                }),
        ]))));
  }

  Future listen(Chinese lang) async {
    lastWords = "";
    bool available = await speech.initialize(
        onStatus: statusListener, onError: errorListener);
    if (available) {
      speech.listen(
          onResult: resultListener,
          listenFor: Duration(seconds: 10),
          localeId: Speech.locale(lang),
          onSoundLevelChange: soundLevelListener,
          cancelOnError: true,
          partialResults: true);
    } else {
      print("The user has denied the use of speech recognition.");
    }
  }

  stopListening() {
    //setState(() {
    speech.stop();
    // }
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      lastWords = "${result.recognizedWords}"; //  - ${result.finalResult}";
      if (lastWords == widget.word.chineseText(lang)) {
        stopListening();
      }
      if (!widget.word.chineseText(lang).startsWith(lastWords)) {
        stopListening();
      }
    });
  }

  void errorListener(SpeechRecognitionError error) {
    // print("Received error status: $error, listening: ${speech.isListening}");
    setState(() {
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }

  void statusListener(String status) {
    // print(
    // "Received listener status: $status, listening: ${speech.isListening}");
    setState(() {
      lastStatus = "$status";
    });
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
