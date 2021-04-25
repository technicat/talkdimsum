import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/dish.dart';
import 'package:talkdimsum/ui/common/dish/dish_description_widget.dart';
import 'package:talkdimsum/ui/common/dish/dish_image_widget.dart';
import 'package:talkdimsum/ui/cupertino/word/word_widget.dart';

import 'favorite_button.dart';

class DishWidget extends StatelessWidget {
  final Dish dish;

  DishWidget({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DishTapImageWidget(dish: dish),
      WordWidget(word: dish.word),
      Expanded(child: DishDescriptionWidget(dish: dish)),
      FavoriteButton(dish: dish)
    ]);
  }
}
