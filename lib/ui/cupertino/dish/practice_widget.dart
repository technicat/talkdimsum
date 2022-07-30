import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/word.dart';

import 'package:talkdimsum/ui/common/word/chinese_text.dart';
import 'package:talkdimsum/ui/common/word/pronounce_text.dart';

import 'package:talkdimsum/ui/cupertino/settings/speed_slider.dart';
import 'package:talkdimsum/ui/cupertino/settings/language_segment_congrol.dart';

import 'package:talkdimsum/ui/cupertino/tts/play_button.dart';

import '../stt/stt_widget.dart';

class PracticeWidget extends StatelessWidget {
  final Word word;

  PracticeWidget({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(word.english)),
      child: SafeArea(
          child: Center(
              child: Column(children: [
        LanguageSegmentControl(),
        Spacer(),
        SpeedSlider(),
        PlayButton(word: word),
        ChineseText(word: word),
        PronounceText(word: word),
        Spacer(),
        STTWidget(word: word)
      ]))));
}
