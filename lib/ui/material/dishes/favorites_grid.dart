import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/ui/common/error_text.dart';

import 'dishes_grid.dart';

import '../progress.dart';

class FavoritesScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Favorites')), body: FavoritesGrid());
  }
}

class FavoritesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      var dimsum = watch(dimsumProvider);
      return dimsum.map(
          data: (_) => DishesGrid(dishes: _.value.favorites),
          loading: (_) => Progressor(),
          error: (_) => ErrorText(error: _.error));
    });
  }
}
