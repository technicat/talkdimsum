import 'package:flutter/widgets.dart';

import 'package:talkdimsum/core/model/word.dart';

import 'package:talkdimsum/ui/common/stt/stt_text.dart';
import 'package:talkdimsum/ui/common/stt/stt_status_text.dart';

import 'stt_button.dart';

class STTWidget extends StatelessWidget {
  final Word word;

  STTWidget({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Column(children: [STTStatusText(), STTText(), STTButton(word: word)]);
}
