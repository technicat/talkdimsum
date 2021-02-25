import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/word.dart';

import '../router.gr.dart';

class PracticeButton extends StatelessWidget {
  final Word word;

  PracticeButton({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Icon(CupertinoIcons.mic),
      onPressed: () {
        Navigator.pushNamed(
            context,
            Routes.practiceWidget,
            arguments: PracticeWidgetArguments(word: word));
      },
    );
  }
}
