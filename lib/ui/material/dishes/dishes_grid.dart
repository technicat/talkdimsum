import 'package:flutter/material.dart';

import 'package:talkdimsum/core/model/dish.dart';

import 'package:talkdimsum/ui/common/dish/dish_image_text_widget.dart';

import 'package:talkdimsum/ui/material/dish/dish_scaffold.dart';

class DishesGrid extends StatelessWidget {
  final List<Dish> dishes;

  DishesGrid({Key? key, required this.dishes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
        maxCrossAxisExtent: 150,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: dishes
            .map((dish) => GridTile(
                child: //DishImageWidget(dish: dish))).toList());
                    DishCardCellWidget(dish: dish)))
            .toList());
  }
}

class DishCardCellWidget extends StatelessWidget {
  final Dish dish;

  DishCardCellWidget({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DishScaffold(dish: dish)),
              );
            },
            child: DishImageTextWidget(dish: dish)));
  }
}
