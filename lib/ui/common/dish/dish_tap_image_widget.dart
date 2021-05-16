import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:talkdimsum/core/model/dish.dart';
import 'dish_image_widget.dart';

class DishTapImageWidget extends StatelessWidget {
  final Dish dish;

  DishTapImageWidget({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
        label: 'Photo',
        hint: 'Tap for info on where this photo was taken.',
        value: dish.word.english,
        child: GestureDetector(
            onTap: () => Get.snackbar('Photo taken at ', dish.images[0].place,
                snackPosition: SnackPosition.BOTTOM),
            child: ExcludeSemantics(child: DishImageWidget(dish: dish))));
  }
}
