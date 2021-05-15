import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:talkdimsum/core/model/word.dart';

import 'practice_widget.dart';

class PracticeButton extends StatelessWidget {
  final Word word;

  PracticeButton({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Icon(CupertinoIcons.mic,
          semanticLabel: 'Practice pronouncing this word'),
      onPressed: () => Get.to(PracticeWidget(word: word)),
    );
  }
}
