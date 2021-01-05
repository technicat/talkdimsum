import 'package:flutter/widgets.dart';

import 'package:talkdimsum/core/model/dish.dart';

class DishImageWidget extends StatelessWidget {

  final Dish dish;

  DishImageWidget({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    AspectRatio(
         aspectRatio: 4/ 3,
         child:
      Image.asset('assets/images/dish/${dish.images[0].name}.jpg', fit: BoxFit.fill));
    }
}
