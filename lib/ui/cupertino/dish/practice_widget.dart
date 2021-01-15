import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/word.dart';

import 'package:talkdimsum/ui/common/word/word_chinese_widget.dart';
import 'package:talkdimsum/ui/common/word/word_pronounce_widget.dart';

import 'package:talkdimsum/ui/cupertino/speech/speed_widget.dart';
import 'package:talkdimsum/ui/cupertino/speech/language_widget.dart';

import 'package:talkdimsum/ui/cupertino/tts/play_button.dart';

import '../stt/stt_widget.dart';

class PracticeWidget extends StatelessWidget {
  final Word word;

  PracticeWidget({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('${word.english}')),
        child: SafeArea(
            child: Center(
                child: Column(children: <Widget>[
          LanguageWidget(),
          Spacer(),
          SpeedWidget(),
          PlayButton(word: word),
          WordChineseWidget(word: word),
          WordPronounceWidget(word: word),
          Spacer(),
          STTWidget(word:word)
        ]))));
  }
}
