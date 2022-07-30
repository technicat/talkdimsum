/* Technicat LLC */

import 'package:flutter/widgets.dart';
import 'package:talkdimsum/core/model/region.dart';

import 'place_row.dart';

class PlacesListView extends StatelessWidget {
  final Region region;

  PlacesListView({Key? key, required this.region}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
      children: region.places
          .map((place) => PlaceRow(region: region, place: place))
          .toList());
}
