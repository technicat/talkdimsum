
import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/dimsum.dart';
//import 'package:talkdimsum/core/word.dart';

import '../dishes/dishes_widget.dart';

class FavoritesWidget extends StatelessWidget {

////	FavoritesWidget({Key key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Favorites'),
        ),
        child: SafeArea(child: DishesWidget(dishes: DimSum.favorites)));
  }
}

