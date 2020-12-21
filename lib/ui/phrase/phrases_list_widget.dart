import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

import 'package:talkdimsum/core/phrases.dart';
import 'package:talkdimsum/core/word.dart';

import 'package:talkdimsum/ui/dish/dish_word_widget.dart';

class PhrasesListWidget extends StatelessWidget {

  final Phrases phrases;

  PhrasesListWidget({Key key, @required this.phrases}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Container(
        color: Colors.yellow.withAlpha(64),
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: 

          phrases.lines.expand((line)=>makeBubbles(context, line)).toList(),
      ),
    );
  }

  Bubble makeBubbleOther(BuildContext context, Word word) {
  double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double px = 1 / pixelRatio;

    BubbleStyle style = BubbleStyle(
      nip: BubbleNip.leftTop,
      color: Colors.white,
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 8.0, right: 50.0),
      alignment: Alignment.topLeft,
    );

     return Bubble(
              style: style,
              child: DishWordWidget(word: word),
            );
  }

  Bubble makeBubbleMe(BuildContext context, Word word) {
  double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double px = 1 / pixelRatio;

    BubbleStyle style = BubbleStyle(
      nip: BubbleNip.rightTop,
      color: Color.fromARGB(255, 225, 255, 199),
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 8.0, left: 50.0),
      alignment: Alignment.topRight,
    );

     return Bubble(
              style: style,
              child: DishWordWidget(word: word),
            );
  }

  List<Bubble> makeBubbles(BuildContext context, Line line) {
    if (line.name == "a") {
      return line.words.map((word)=>makeBubbleOther(context,word)).toList();
    } else {
      return line.words.map((word)=>makeBubbleMe(context,word)).toList();
    }
  }
   
}