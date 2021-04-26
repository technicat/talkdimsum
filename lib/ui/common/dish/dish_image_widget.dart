import 'package:flutter/widgets.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:talkdimsum/core/model/dish.dart';

class DishImageWidget extends StatelessWidget {
  final Dish dish;

  DishImageWidget({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 4 / 3,
        child: Image.asset('assets/images/dish/${dish.images[0].name}.jpg',
            fit: BoxFit.fill));
  }
}

class DishTapImageWidget extends StatelessWidget {
  final Dish dish;

  DishTapImageWidget({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          /*   Fluttertoast.showToast(
                              msg: 'Photo taken at '+dish.images[0].place,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0); */
          /*       Flushbar(
            title: 'Photo taken at',
            message: dish.images[0].place,
            duration: Duration(seconds: 3),
          )..show(context); */
        },
        child: DishImageWidget(dish: dish));
  }
}
