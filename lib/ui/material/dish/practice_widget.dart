import 'package:flutter/material.dart';

import 'package:talkdimsum/core/model/word.dart';

import 'package:talkdimsum/ui/common/word/chinese_text.dart';
import 'package:talkdimsum/ui/common/word/pronounce_text.dart';

import 'package:talkdimsum/ui/material/settings/language_dropdown.dart';
import 'package:talkdimsum/ui/material/settings/speed_slider.dart';

import 'package:talkdimsum/ui/material/tts/play_button.dart';
import 'package:talkdimsum/ui/material/stt/stt_widget.dart';

class PracticeWidget extends StatelessWidget {
  final Word word;

  PracticeWidget({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text('${word.english}')),
      body: Column(children: <Widget>[
        LanguageDropdown(),
        SpeedSlider(),
        PlayButton(word: word),
        ChineseText(word: word),
        PronounceText(word: word),
        Spacer(),
        STTWidget(word: word)
      ]));
}
