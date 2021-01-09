import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/dish.dart';

import 'dish_summary_widget.dart';

class DishWidget extends StatelessWidget {
  final Dish dish;

  DishWidget({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return Consumer<DimSum>(builder: (context, dimsum, child) {
      return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(),
          child: SafeArea(child: DishSummaryWidget(dish: dish)));
 //   });
  }
}
