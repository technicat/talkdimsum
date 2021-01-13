import 'package:flutter/cupertino.dart';
import 'package:flushbar/flushbar.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/model/dish.dart';
import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/ui/common/dish/dish_description_widget.dart';
import 'package:talkdimsum/ui/common/dish/dish_image_widget.dart';

import 'dish_word_widget.dart';

class DishSummaryWidget extends StatelessWidget {
  final Dish dish;

  DishSummaryWidget({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      GestureDetector(
          onTap: () {
            Flushbar(
              title: "Photo taken at",
              message: dish.images[0].place,
              duration: Duration(seconds: 3),
            )..show(context);
          },
          child: DishImageWidget(dish: dish)),
      DishWordWidget(word: dish.word),
      Expanded(child: DishDescriptionWidget(dish: dish)),
      FavoriteButton(dish: dish)
    ]);
  }
}

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
