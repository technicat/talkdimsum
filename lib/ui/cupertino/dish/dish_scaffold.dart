import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/dish.dart';

import 'dish_summary_widget.dart';

class DishScaffold extends StatelessWidget {
  final Dish dish;

  DishScaffold({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: Text('Talk Dim Sum') // for lack of anything better
            ),
        child: SafeArea(child: DishSummaryWidget(dish: dish)));
  }
}
