import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/dish.dart';

import 'dish_widget.dart';

class DishScaffold extends StatelessWidget {
  final Dish dish;

  DishScaffold({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Text('Talk Dim Sum') // for lack of anything better
          ),
      child: SafeArea(child: DishWidget(dish: dish)));
}
