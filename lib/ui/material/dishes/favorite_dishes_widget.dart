import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';

import 'dishes_grid.dart';

class FavoriteDishesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorites'),
        ),
        body: Consumer<DimSum>(builder: (context, dimsum, child) {
          return DishesGrid(dishes: dimsum.favorites);
        }));
  }
}
