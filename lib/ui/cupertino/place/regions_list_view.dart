/* Technicat LLC */

import 'package:flutter/widgets.dart';

import 'package:talkdimsum/core/model/country.dart';

import 'region_button.dart';

class RegionsListView extends StatelessWidget {
  final Country country;

  RegionsListView({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
      child: ListView(
          children: country.regions
              .map((region) => RegionButton(region: region))
              .toList()));
}
