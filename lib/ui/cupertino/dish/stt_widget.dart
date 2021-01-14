import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

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
                    onPressed: () {
                      stt.listen(word,settings.language);
                    },
                  )));
  }

}
