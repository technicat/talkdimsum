import 'package:flutter/cupertino.dart';
import 'package:flushbar/flushbar.dart';

import 'package:talkdimsum/core/model/dish.dart';
import 'package:talkdimsum/ui/common/dish/dish_description_widget.dart';
import 'package:talkdimsum/ui/common/dish/dish_image_widget.dart';

import 'dish_word_widget.dart';
import 'favorite_button.dart';

class DishWidget extends StatelessWidget {
  final Dish dish;

  DishWidget({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      GestureDetector(
          onTap: () {
            Flushbar(
              title: "Photo taken at",
              message: dish.images[0].place,
              duration: Duration(seconds: 3),
            )..show(context);
          },
          child: DishImageWidget(dish: dish)),
      DishWordWidget(word: dish.word),
      Expanded(child: DishDescriptionWidget(dish: dish)),
      FavoriteButton(dish: dish)
    ]);
  }
}

