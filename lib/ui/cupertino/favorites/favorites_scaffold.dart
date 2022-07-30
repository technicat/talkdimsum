import 'package:flutter/cupertino.dart';

import 'favorites_grid.dart';

class FavoritesScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Favorites'),
      ),
      child: SafeArea(child: FavoritesGrid()));
}
