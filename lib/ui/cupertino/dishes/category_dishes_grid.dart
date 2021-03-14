import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/dish.dart';
import 'package:talkdimsum/ui/common/dish/dish_image_text_widget.dart';
import 'word_dishes_scaffold.dart';

class CategoryDishesGrid extends StatelessWidget {
  final List<Dish> dishes;

  CategoryDishesGrid({Key key, @required this.dishes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
        maxCrossAxisExtent: 150,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children:
            dishes.map((dish) => CategoryDishWidget(dish: dish)).toList());
  }
}

class CategoryDishWidget extends StatelessWidget {
  final Dish dish;

  CategoryDishWidget({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
            Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute(
                    builder: (context) => WordDishesScaffold(word: dish.word)),
          );
        },
        child: DishImageTextWidget(dish: dish));
  }
}
