import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';

import 'package:talkdimsum/ui/cupertino/dishes/dishes_grid.dart';

class FavoritesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DimSum>(
        builder: (context, dimsum, child) =>
            DishesGrid(dishes: dimsum.favorites));
  }
}
