import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/dish.dart';

import 'package:talkdimsum/ui/cupertino/dish/dish_scaffold.dart';
import 'package:talkdimsum/ui/common/dish/dish_image_text_widget.dart';

class DishesGrid extends StatelessWidget {
  final List<Dish> dishes;

  DishesGrid({Key key, @required this.dishes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
        maxCrossAxisExtent: 150,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: dishes.map((dish) => DishCellWidget(dish: dish)).toList());
  }
}

class DishCellWidget extends StatelessWidget {
  final Dish dish;

  DishCellWidget({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // push on top of bottom tab bar
          Navigator.of(context, rootNavigator: true).push(
            CupertinoPageRoute(builder: (context) => DishScaffold(dish: dish)),
          );
        },
        child: DishImageTextWidget(dish: dish));
  }
}
