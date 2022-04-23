import 'package:flutter/material.dart';
import 'package:talkdimsum/core/model/dish.dart';
import 'package:talkdimsum/ui/material/dish/dish_scaffold.dart';

class DishPager extends StatelessWidget {
  final List<Dish> dishes;

  DishPager({Key? key, required this.dishes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(

        /// [PageView.scrollDirection] defaults to [Axis.horizontal].
        /// Use [Axis.vertical] to scroll vertically.
        controller: controller,
        children: dishes.map((dish) => DishScaffold(dish: dish)).toList());
  }
}
