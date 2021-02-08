import 'package:flutter/cupertino.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/model/dish.dart';
import 'package:talkdimsum/core/provider/dimsum.dart';

class FavoriteButton extends StatelessWidget {
  final Dish dish;

  FavoriteButton({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      var dimsum = watch(dimsumProvider);
      return dimsum.map(
          data: (_) => _.value.isFavorite(dish)
              ? CupertinoButton(
                  child: Icon(CupertinoIcons.heart_fill),
                  onPressed: () {
                    _.value.removeFavorite(dish);
                  })
              : CupertinoButton(
                  child: Icon(CupertinoIcons.heart),
                  onPressed: () {
                    _.value.addFavorite(dish);
                  }),
          loading: (_) => CupertinoActivityIndicator(),
          error: (_) => Text(
                _.error.toString(),
                style: TextStyle(color: CupertinoColors.destructiveRed),
              ));
    });
  }
}
