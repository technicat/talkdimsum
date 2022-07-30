import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/ui/common/error_text.dart';
import 'package:talkdimsum/ui/material/progress.dart';

import 'dishes_grid.dart';

class FavoritesScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: Text('favorites')), body: FavoritesGrid());
}

class FavoritesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Consumer(builder: (context, ref, child) {
        var dimsum = ref.watch(dimsumProvider);
        return dimsum.map(
            data: (_) => DishesGrid(dishes: _.value.favorites),
            loading: (_) => Progressor(),
            error: (_) => ErrorText(error: _.error));
      });
}
