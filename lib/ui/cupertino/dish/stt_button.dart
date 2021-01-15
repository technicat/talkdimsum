import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/core/provider/settings.dart';

import 'package:talkdimsum/core/provider/stt.dart';

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
                      stt.stop();
                    },
                  )
                : CupertinoButton(
                    child: Icon(CupertinoIcons.mic),
                    onPressed: () {
                      stt.listen(word, settings.language);
                    },
                  )));
  }
}

/*  return if (stt.lastWords == widget.word.chineseText(settings.language))
            Text('You got it!',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
          if (!widget.word.chineseText(settings.language).startsWith(lastWords))
            Text('Wrong!',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24))
           
          Text('$lastWords',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
          Spacer(), */

class STTStatusText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<STT>(builder: (context, stt, child) {
      switch (stt.status) {
        case STTStatus.Match:
          {
            return Text('Correct!',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24));
          }
        case STTStatus.Mismatch:
          {
            return Text('Wrong!',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24));
          }
        default:
          {
            return Text(stt.lastStatus,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24));
          }
      }
    });
  }
}

class STTText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<STT>(
        builder: (context, stt, child) => Text('${stt.lastWords}',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 24)));
  }
}
