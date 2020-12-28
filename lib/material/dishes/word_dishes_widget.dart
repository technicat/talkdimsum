
import 'package:flutter/material.dart';

import 'package:talkdimsum/core/dimsum.dart';
import 'package:talkdimsum/core/word.dart';

import 'dishes_widget.dart';

class WordDishesWidget extends StatelessWidget {

	final Word word;

	WordDishesWidget({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(word.display()),
        ),
        body: DishesWidget(dishes: DimSum.dishes.where((dish) => dish.words.contains(word) || dish.hasTag(word)).toList()));
  }
}

