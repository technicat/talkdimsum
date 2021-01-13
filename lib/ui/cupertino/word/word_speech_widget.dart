import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/ui/common/word/word_chinese_widget.dart';

import '../dish/practice_widget.dart';
import 'word_play_widget.dart';


class WordSpeechWidget extends StatelessWidget {
  final Word word;

  WordSpeechWidget({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          WordPlayWidget(word: word),
          WordChineseWidget(word: word),
          CupertinoButton(
            child: Icon(CupertinoIcons.mic),
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => PracticeWidget(word: word)));
            },
          ),
        ]);
  }
}
