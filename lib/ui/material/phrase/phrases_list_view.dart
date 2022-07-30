import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

import 'package:talkdimsum/core/model/phrases.dart';
import 'package:talkdimsum/core/model/line.dart';

import 'bubbles.dart';

class PhrasesListView extends StatelessWidget {
  final Phrases phrases;

  PhrasesListView({Key? key, required this.phrases}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.yellow.withAlpha(64),
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: phrases.lines
              .expand((line) => makeBubbles(context, line))
              .toList(),
        ),
      );

  List<Bubble> makeBubbles(BuildContext context, Line line) => line.name == 'a'
      ? line.words.map((word) => BubbleOther(word: word)).toList()
      : line.words.map((word) => BubbleMe(word: word)).toList();
}
