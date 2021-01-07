import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/model/dish.dart';
import 'package:talkdimsum/core/provider/dimsum.dart';

import 'dish_summary_widget.dart';

class DishWidget extends StatelessWidget {
  final Dish dish;

  DishWidget({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DimSum>(builder: (context, dimsum, child) {
      return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
              middle: dimsum.isFavorite(dish)
                  ? CupertinoButton(
                      child: Icon(CupertinoIcons.heart_fill),
                      onPressed: () {
                        dimsum.removeFavorite(dish);
                      })
                  : CupertinoButton(
                      child: Icon(CupertinoIcons.heart),
                      onPressed: () {
                        dimsum.addFavorite(dish);
                      }),
              trailing: Icon(CupertinoIcons.number)),
          child: SafeArea(child: DishSummaryWidget(dish: dish)));
    });
  }
}
