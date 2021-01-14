import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

//import 'package:speech_to_text/speech_recognition_error.dart';
//import 'package:speech_to_text/speech_recognition_result.dart';

import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/core/provider/settings.dart';

import 'package:talkdimsum/core/provider/stt.dart';

class STTWidget extends StatelessWidget {
  final Word word;

  STTWidget({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        /*  return if (stt.lastWords == widget.word.chineseText(settings.language))
            Text('You got it!',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
          if (!widget.word.chineseText(settings.language).startsWith(lastWords))
            Text('Wrong!',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24))
           
          Text('$lastWords',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
          Spacer(), */
        STTButton(word: word);
  }

  /* Future listen(Chinese lang) async {
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
*/

}

class STTButton extends StatelessWidget {
  final Word word;

  STTButton({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(
        builder: (context, settings, child) => Consumer<STT>(
            builder: (context, stt, child) => stt.speech.isListening
                ? CupertinoButton(
                    child: Icon(CupertinoIcons.pause),
                    onPressed: () {
                      stt.stopListening();
                    },
                  )
                : CupertinoButton(
                    child: Icon(CupertinoIcons.mic),
                    //  tooltip: 'Practice saying this word',
                    onPressed: () {
                      stt.listen(settings.language);
                    },
                  )));
  }

}
