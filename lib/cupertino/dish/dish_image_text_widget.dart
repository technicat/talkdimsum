import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/dish.dart';

import 'dish_image_widget.dart';



class DishImageTextWidget extends StatelessWidget {

  final Dish dish;

  DishImageTextWidget({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
     Column(children: <Widget>[
                  DishImageWidget(dish: dish),
                  Text('${dish.word.english}',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold))
                ]);
    }
}
