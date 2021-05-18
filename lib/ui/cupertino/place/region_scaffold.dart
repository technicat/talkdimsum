/* Technicat LLC */

import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/region.dart';

import 'places_list_view.dart';

class RegionScaffold extends StatelessWidget {
  final Region region;

  RegionScaffold({Key? key, required this.region}) : super(key: key);

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(region.name)),
      child: SafeArea(child: PlacesListView(region: region)));
}
