import 'package:flutter/material.dart';

import 'package:talkdimsum/core/model/dish.dart';

import 'package:talkdimsum/ui/common/dish/dish_description_widget.dart';
import 'package:talkdimsum/ui/common/dish/dish_tap_image_widget.dart';

import '../word/word_widget.dart';

import 'tags_row.dart';

class DishWidget extends StatelessWidget {
  final Dish dish;

  DishWidget({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(children: [
        WordWidget(word: dish.word),
        Expanded(child: DishDescriptionWidget(dish: dish)),
        // broken navigation
        // TagsRow(dish: dish),
        DishTapImageWidget(dish: dish)
      ]);
}
