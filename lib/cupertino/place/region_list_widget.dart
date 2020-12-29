/* Technicat LLC */

import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/region.dart';
import 'package:talkdimsum/core/country.dart';

import 'place_list_widget.dart';

class RegionListWidget extends StatelessWidget {
  final Country country;

  RegionListWidget({Key key, @required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
            children: country.regions
                .map((place) => _placeTile(context, place))
                .toList()));
  }

  Widget _placeTile(BuildContext context, Region region) => CupertinoButton(
      onPressed: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => PlaceListWidget(region: region)),
        );
      },
      child: Text(region.name,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)));
}
