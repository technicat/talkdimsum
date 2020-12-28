import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/dimsum.dart';
import 'package:talkdimsum/core/dish.dart';

import 'package:talkdimsum/cupertino/dish/dish_image_text_widget.dart';

import 'word_dishes_widget.dart';

class CategoriesWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CategoryDishesWidget(dishes: DimSum.categories.map((tag) => Dish.dishes[tag]).toList());
  }
}

class CategoryDishesWidget extends StatelessWidget {

  final List<Dish> dishes;

  CategoryDishesWidget({Key key, @required this.dishes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
        maxCrossAxisExtent: 150,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children:
            dishes.map((dish) => CategoryCellWidget(dish: dish)).toList());
  }
}

class CategoryCellWidget extends StatelessWidget {

  final Dish dish;

  CategoryCellWidget({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => WordDishesWidget(word: dish.word)),
                  );
                },
                child: 
                  DishImageTextWidget(dish: dish));
    }
}
