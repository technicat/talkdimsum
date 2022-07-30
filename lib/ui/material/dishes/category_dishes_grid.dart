import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:talkdimsum/core/model/dish.dart';

import 'package:talkdimsum/ui/common/dish/dish_image_text_widget.dart';

import 'word_dishes_scaffold.dart';

class CategoryDishesGrid extends StatelessWidget {
  final List<Dish> dishes;

  CategoryDishesGrid({Key? key, required this.dishes}) : super(key: key);

  @override
  Widget build(BuildContext context) => GridView.extent(
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: dishes
          .map((dish) => GridTile(child: CategoryCellWidget(dish: dish)))
          .toList());
}

class CategoryCellWidget extends StatelessWidget {
  final Dish dish;

  CategoryCellWidget({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
      child: InkWell(
          onTap: () => Get.to(() => WordDishesScaffold(word: dish.word)),
          child: DishImageTextWidget(dish: dish)));
}
