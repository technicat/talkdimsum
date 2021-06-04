import 'package:flutter/cupertino.dart';
//import 'package:get/get.dart';

import 'favorites_grid.dart';

class FavoritesScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('favorites'), // .tr),
      ),
      child: SafeArea(child: FavoritesGrid()));
}
