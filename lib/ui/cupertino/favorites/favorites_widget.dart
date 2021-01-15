import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';

import '../dishes/dishes_grid.dart';

class FavoritesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Favorites'),
        ),
        child: SafeArea(
            child: Consumer<DimSum>(
                builder: (context, dimsum, child) =>
                    DishesGrid(dishes: dimsum.favorites))));
  }
}
