import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/model/dish.dart';
import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/ui/common/error_text.dart';

import '../progress.dart';
import 'dish_character_menu_button.dart';
import 'dish_info_menu_button.dart';
import 'dish_widget.dart';


class DishScaffold extends StatelessWidget {
  final Dish dish;

  DishScaffold({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Consumer(builder: (context, ref, child) {
        var dimsum = ref.watch(dimsumProvider);
        return dimsum.map(
            data: (_) => Scaffold(
                floatingActionButton: Obx(() => _.value.favorites.contains(dish)
                    ? FloatingActionButton(
                        onPressed: () {
                          if (_.value.favorites.contains(dish)) {
                            _.value.removeFavorite(dish);
                          }
                        },
                        child: Icon(Icons.favorite,
                            semanticLabel: 'Remove this dish from favorites'))
                    : FloatingActionButton(
                        onPressed: () {
                          if (!_.value.favorites.contains(dish)) {
                            _.value.addFavorite(dish);
                          }
                        },
                        child: Icon(Icons.favorite_border,
                            semanticLabel: 'Add this dish to favorites'))),
                appBar: AppBar(actions: <Widget>[
                  DishCharacterMenuButton(dish: dish),
                  DishInfoMenuButton(dish: dish)
                ]),
                body: DishWidget(dish: dish)),
            loading: (_) => Progressor(),
            error: (_) => ErrorText(error: _.error));
      });
}

