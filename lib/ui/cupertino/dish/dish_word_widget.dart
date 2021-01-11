import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/core/util/speech.dart';
import 'package:talkdimsum/core/util/settings.dart';

import 'practice_widget.dart';

class DishWordWidget extends StatelessWidget {
  final Word word;

  DishWordWidget({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('${word.english}',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        CupertinoButton(
          child: Icon(CupertinoIcons.volume_up),
          // tooltip: 'Hear how this dish is pronounced in Chinese',
          onPressed: () {
            Speech.sayWord(word, Settings.language, Settings.speed);
          },
        ),
        Text('${word.chineseText(Settings.language)}',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
        CupertinoButton(
          child: Icon(CupertinoIcons.mic),
          // tooltip: 'Play and practice this word',
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => PracticeWidget(word: word)));
          },
        ),
      ]),
      Text('${word.pronunciation(Settings.language)}',
          textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
    ]);
  }
}
