import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/core/model/dish.dart';

import 'package:talkdimsum/ui/common/dish/dish_image_text_widget.dart';

import 'word_dishes_widget.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DimSum>(builder: (context, dimsum, child) {
      return CategoryDishesWidget(
          dishes: dimsum.categories); // categories.map((tag) => Dish.dishes[tag]).toList());
    });
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
        children: dishes
            .map((dish) => GridTile(child: CategoryCellWidget(dish: dish)))
            .toList());
  }
}

class CategoryCellWidget extends StatelessWidget {
  final Dish dish;

  CategoryCellWidget({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WordDishesWidget(word: dish.word)),
              );
            },
            child: DishImageTextWidget(dish: dish)));
  }
}
