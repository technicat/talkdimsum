import 'package:flutter/cupertino.dart';

import 'package:flushbar/flushbar.dart';

import 'package:talkdimsum/core/dish.dart';

import 'dish_word_widget.dart';
import 'dish_image_widget.dart';
//import 'dish_tags_widget.dart';
import 'dish_description_widget.dart';


class DishSummaryWidget extends StatelessWidget {

  final Dish dish;

  DishSummaryWidget({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Column(children: <Widget>[
                          DishWordWidget(word: dish.word),
                          Expanded(
                            child: DishDescriptionWidget(dish: dish)),
                          GestureDetector(
                              onTap: () {
                              Flushbar(
                  title:  "Photo taken at",
                  message:  dish.images[0].place,
                  duration:  Duration(seconds: 3),              
                )..show(context);
                              }, 
                              child: DishImageWidget(dish: dish)
                              ),
                        //  RowTagsWidget(dish: dish),
                          ]);
    }
}

