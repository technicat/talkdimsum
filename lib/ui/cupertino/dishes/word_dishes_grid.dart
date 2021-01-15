import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/core/model/word.dart';

import 'dishes_grid.dart';

class WordDishesGrid extends StatelessWidget {
  final Word word;

  WordDishesGrid({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DimSum>(
        builder: (context, dimsum, child) =>
            DishesGrid(dishes: dimsum.dishes(word)));
  }
}
