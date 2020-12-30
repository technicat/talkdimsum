import 'package:flutter/cupertino.dart';

//import 'package:share/share.dart';
//import 'package:url_launcher/url_launcher.dart';

import 'package:talkdimsum/core/dish.dart';

import 'dish_summary_widget.dart';


class DishWidget extends StatelessWidget {

  final Dish dish;

 DishWidget({Key key, @required this.dish}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: 
        CupertinoNavigationBar(
         middle: Text('${dish.word.english}'),
        ),
      child: SafeArea(child: DishSummaryWidget(dish: dish)));
  }
}




