import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/core/model/word.dart';

import 'dishes_widget.dart';

class WordDishesGrid extends StatelessWidget {
  final Word word;

  WordDishesGrid({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DimSum>(builder: (context, dimsum, child) {
          return DishesWidget(dishes: dimsum.dishes(word));
        });
  }
}
