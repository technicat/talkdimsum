import 'package:flutter/widgets.dart';
import 'package:bubble/bubble.dart';

import 'package:talkdimsum/core/model/phrases.dart';

import 'bubbles.dart';

class PhrasesListView extends StatelessWidget {
  final Phrases phrases;

  PhrasesListView({Key key, @required this.phrases}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: phrases.lines
            .expand((line) => makeBubbles(context, line))
            .toList());
  }

  List<Bubble> makeBubbles(BuildContext context, Line line) {
    if (line.name == 'a') {
      return line.words.map((word) => BubbleOther(word: word)).toList();
    } else {
      return line.words.map((word) => BubbleMe(word: word)).toList();
    }
  }
}
