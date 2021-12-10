import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/dish.dart';
import 'package:talkdimsum/ui/common/dish/dish_description_widget.dart';
import 'package:talkdimsum/ui/common/dish/dish_tap_image_widget.dart';
import 'package:talkdimsum/ui/cupertino/word/word_widget.dart';

// todo - cupertino version
//import 'package:talkdimsum/ui/material/dish/dish_character_menu_button.dart';
//import 'package:talkdimsum/ui/material/dish/dish_info_menu_button.dart';

import 'favorite_button.dart';

class DishWidget extends StatelessWidget {
  final Dish dish;

  DishWidget({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(children: [
        DishTapImageWidget(dish: dish),
        WordWidget(word: dish.word),
        Expanded(child: DishDescriptionWidget(dish: dish)),
        Row(children: [
          DishInfoButton(dish: dish),
          Spacer(),
          FavoriteButton(dish: dish),
          Spacer(),
          //    DishCharacterMenuButton(dish: dish),
        ])
      ]);
}

class DishInfoButton extends StatelessWidget {
  final Dish dish;

  DishInfoButton({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: () {
          showCupertinoModalPopup(
              context: context,
              builder: (_) => CupertinoActionSheet(
                      title: Text('More about...'),
                      message: Text(dish.word.english),
                      actions: [
                        ...dish.resources.map((link) =>
                            CupertinoActionSheetAction(
                                onPressed: () => link.goto(),
                                child: Text(link.name)))
                      ]));
        },
        child:
            Icon(CupertinoIcons.info, semanticLabel: 'Links to web resources'));
  }
}
