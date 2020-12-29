import 'package:flutter/cupertino.dart';
import 'package:bubble/bubble.dart';

import 'package:talkdimsum/core/phrases.dart';
import 'package:talkdimsum/core/word.dart';

import 'package:talkdimsum/ui/cupertino/dish/dish_word_widget.dart';

class PhrasesListWidget extends StatelessWidget {
  final Phrases phrases;

  PhrasesListWidget({Key key, @required this.phrases}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: phrases.lines
            .expand((line) => makeBubbles(context, line))
            .toList());
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
      return line.words.map((word) => BubbleOther(word: word)).toList();
    } else {
      return line.words.map((word) => BubbleMe(word: word)).toList();
    }
  }
}

class BubbleOther extends Bubble {
  final Word word;

  BubbleOther({Key key, @required this.word}) : super();

  @override
  Widget build(BuildContext context) {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double px = 1 / pixelRatio;

    BubbleStyle style = BubbleStyle(
      nip: BubbleNip.leftTop,
      color: CupertinoColors.white,
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 8.0, right: 50.0),
      alignment: Alignment.topLeft,
    );

    return Bubble(
      style: style,
      child: DishWordWidget(word: word),
    );
  }
}

class BubbleMe extends Bubble {
  final Word word;

  BubbleMe({Key key, @required this.word}) : super();

  @override
  Widget build(BuildContext context) {
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
}
