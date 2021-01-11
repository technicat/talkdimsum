import 'package:flutter/widgets.dart';

import 'package:talkdimsum/core/model/dish.dart';

class DishDescriptionWidget extends StatelessWidget {
  final Dish dish;

  DishDescriptionWidget({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child:
                Text('${dish.description}', style: TextStyle(fontSize: 18))));
  }
}
