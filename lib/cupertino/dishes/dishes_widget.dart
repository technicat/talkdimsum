import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/dish.dart';

import 'package:talkdimsum/ui/dish/dish_widget.dart';
import 'package:talkdimsum/ui/dish/dish_image_text_widget.dart';

class DishesWidget extends StatelessWidget {

  final List<Dish> dishes;

  DishesWidget({Key key, @required this.dishes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
        maxCrossAxisExtent: 150,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children:
            dishes.map((dish) => GridTile(child: //DishImageWidget(dish: dish))).toList());
            DishCardCellWidget(dish: dish))).toList());
  }
}

class DishCardCellWidget extends StatelessWidget {

  final Dish dish;

  DishCardCellWidget({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      Card(
            child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DishWidget(dish: dish)),
                  );
                },
                child: 
                  DishImageTextWidget(dish: dish)));
    }
}


/*
class DishCellWidget extends StatelessWidget {

  final Dish dish;

  DishCellWidget({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      Card(
            child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StatefulDishWidget(dish: dish)),
                  );
                },
                child: Column(children: <Widget>[
                  DishImageWidget(dish: dish),
                  Text('${dish.English}',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold))
                ])));
    }
} */


