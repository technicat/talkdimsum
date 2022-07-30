import 'package:flutter/widgets.dart';

import 'package:talkdimsum/core/model/dish.dart';

import 'dish_image_widget.dart';

class DishImageTextWidget extends StatelessWidget {
  final Dish dish;

  DishImageTextWidget({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(children: [
        DishImageWidget(dish: dish),
        Text(dish.word.english,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))
      ]);
}
