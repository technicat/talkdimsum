import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:bubble/bubble.dart';

import 'package:talkdimsum/core/model/word.dart';

import 'package:talkdimsum/ui/cupertino/word/word_widget.dart';

class BubbleOther extends Bubble {
  final Word word;

  BubbleOther({Key? key, required this.word}) : super();

  @override
  Widget build(BuildContext context) {
    var pixelRatio = MediaQuery.of(context).devicePixelRatio;
    var px = 1 / pixelRatio;

    var style = BubbleStyle(
      nip: BubbleNip.leftTop,
      color: CupertinoColors.white,
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 8.0, right: 50.0),
      alignment: Alignment.topLeft,
    );

    return Bubble(
      style: style,
      child: WordWidget(word: word),
    );
  }
}

class BubbleMe extends Bubble {
  final Word word;

  BubbleMe({Key? key, required this.word}) : super();

  @override
  Widget build(BuildContext context) {
    var pixelRatio = context.devicePixelRatio;
    var px = 1 / pixelRatio;

    var style = BubbleStyle(
      nip: BubbleNip.rightTop,
      color: Color.fromARGB(255, 225, 255, 199),
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 8.0, left: 50.0),
      alignment: Alignment.topRight,
    );

    return Bubble(
      style: style,
      child: WordWidget(word: word),
    );
  }
}
