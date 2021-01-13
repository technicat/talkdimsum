import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

import 'package:talkdimsum/core/model/dish.dart';
import 'package:talkdimsum/core/provider/dimsum.dart';

class FavoriteButton extends StatelessWidget {
  final Dish dish;

  FavoriteButton({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DimSum>(
        builder: (context, dimsum, child) => dimsum.isFavorite(dish)
            ? CupertinoButton(
                child: Icon(CupertinoIcons.heart_fill),
                onPressed: () {
                  dimsum.removeFavorite(dish);
                })
            : CupertinoButton(
                child: Icon(CupertinoIcons.heart),
                onPressed: () {
                  dimsum.addFavorite(dish);
                }));
  }
}
