import 'package:flutter/material.dart';

import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/core/util/tts.dart';
import 'package:talkdimsum/core/provider/settings.dart';

import 'package:talkdimsum/ui/common/word/word_chinese_widget.dart';
import 'package:talkdimsum/ui/common/word/word_pronounce_widget.dart';

import 'package:talkdimsum/core/provider/stt.dart';

import 'package:talkdimsum/ui/material/word/play_widget.dart';

class PracticeWidget extends StatefulWidget {
  final Word word;

  PracticeWidget({Key key, @required this.word}) : super(key: key);

  @override
  PracticeWidgetState createState() => PracticeWidgetState();
}

class PracticeWidgetState extends State<PracticeWidget>
    with STTState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${widget.word.english}')),
        body: Column(children: <Widget>[
          DropdownButton<Chinese>(
            icon: Icon(Icons.language),
            value: lang,
            onChanged: (value) {
              setState(() {
                lang = value;
              });
            },
            items: [
              const DropdownMenuItem<Chinese>(
                value: Chinese.Cantonese,
                child: Text("Cantonese"),
              ),
              const DropdownMenuItem<Chinese>(
                value: Chinese.Mandarin,
                child: Text("Mandarin"),
              ),
              const DropdownMenuItem<Chinese>(
                value: Chinese.Simplified,
                child: Text("Simplified"),
              ),
            ],
          ),
// add tortoise and hare
          SpeedSlider(),
          PlayWidget(word:word),
          WordChineseWidget(word: word),
          WordPronounceWidget(word:word),

          Spacer(),

          if (lastWords == widget.word.chineseText(lang))
            Text('You got it!',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),

          if (!widget.word.chineseText(lang).startsWith(lastWords))
            Text('Wrong!',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),

          Text('$lastWords',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),

          Spacer(),

          speech.isListening
              ? IconButton(
                  icon: Icon(Icons.pause),
                  tooltip: 'Stop listening',
                  onPressed: () {
                    stopListening();
                  },
                )
              : IconButton(
                  icon: Icon(Icons.mic),
                  tooltip: 'Practice saying this word',
                  onPressed: () {
                    listen();
                  },
                ),
        ]));
  }

  Future listen() async {
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
