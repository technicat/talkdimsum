import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/core/model/word.dart';

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
        body: Consumer<DimSum>(builder: (context, dimsum, child) {
          return DishesWidget(
              dishes: dimsum.dishes
                  .where(
                      (dish) => dish.words.contains(word) || dish.hasTag(word))
                  .toList());
        }));
  }
}
