import 'package:flutter/material.dart';

import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';


import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/core/util/speech.dart';
import 'package:talkdimsum/core/util/settings.dart';

import 'package:talkdimsum/ui/common/dish/practice_mixins.dart';

class PracticeWidget extends StatefulWidget {

  final Word word;

  PracticeWidget({Key key, @required this.word}) : super(key: key);

  @override
  PracticeWidgetState createState() => PracticeWidgetState();
}

class PracticeWidgetState extends State<PracticeWidget> with STTState, TTSState  {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: 
        AppBar(
          title: Text('${widget.word.english}')),
          body: 
     Column(children: <Widget>[

       DropdownButton<Language>(
                    icon: Icon(Icons.language),
                    value: lang,
                    onChanged: (value) {
                      setState(() { lang = value; });
                    },
                    items: [
                      const DropdownMenuItem<Language>(
                              value: Language.Cantonese,
                              child: Text("Cantonese"),
                              ),
                      const DropdownMenuItem<Language>(
                              value: Language.Mandarin,
                              child: Text("Mandarin"),
                              ),
                      const DropdownMenuItem<Language>(
                              value: Language.Simplified,
                              child: Text("Simplified"),
                              ),
                      ],

                ),
// add tortoise and hare
       Slider(
      min: 0.1,
      max: 1.9,
      value: speed,
      onChanged: (value) {
        setState(() {
          speed = value;
        });
      },
    ),
                  IconButton(
                    icon: Icon(Icons.volume_up),
                    tooltip: 'Hear how this dish is pronounced in Chinese',
                    onPressed: () {
                     Speech.sayWord(widget.word,lang,speed);
                    },
                  ),
                  Text('${widget.word.chineseText(lang)}',
                        textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
                 
        Text('${widget.word.pronunciation(lang)}',
              textAlign: TextAlign.center, 
              style: TextStyle(fontSize: 20)),

             Spacer(),

               if (lastWords == widget.word.chineseText(lang))
          Text('You got it!',
              textAlign: TextAlign.center, 
              style: TextStyle(fontSize: 24)),

              if (!widget.word.chineseText(lang).startsWith(lastWords))
          Text('Wrong!',
              textAlign: TextAlign.center, 
              style: TextStyle(fontSize: 24)),

             Text('$lastWords',
              textAlign: TextAlign.center, 
              style: TextStyle(fontSize: 24)),

              Spacer(),

 speech.isListening
                  ? 
        IconButton(
                    icon: Icon(Icons.pause),
                    tooltip: 'Stop listening',
                    onPressed: () {
                     stopListening();
                     },
                  ) :
        IconButton(
                    icon: Icon(Icons.mic),
                    tooltip: 'Practice saying this word',
                    onPressed: () {
                     listen();
                     },
                  ),
        ])); 
  }

Future listen() async{
    lastWords = "";
    bool available = await speech.initialize( 
                            onStatus: statusListener,
                            onError: errorListener );
    if ( available ) {
        speech.listen( 
          onResult: resultListener,
          listenFor: Duration(seconds: 10),
          localeId: Speech.locale(lang),
          onSoundLevelChange: soundLevelListener,
          cancelOnError: true,
          partialResults: true
         );
    }
    else {
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
