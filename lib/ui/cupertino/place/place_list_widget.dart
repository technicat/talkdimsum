/* Technicat LLC */

import 'package:flutter/cupertino.dart';
//import 'package:share/share.dart';
//import 'package:sprintf/sprintf.dart';
//import 'package:url_launcher/url_launcher.dart';

import 'package:talkdimsum/core/place.dart';
import 'package:talkdimsum/core/region.dart';

class PlaceListWidget extends StatelessWidget {
  final Region region;

  PlaceListWidget({Key key, @required this.region}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text(region.name)),
        child: SafeArea(
            child: ListView(
                children: region.places
                    .map((place) => PlaceTile(region: region, place: place))
                    .toList())));
  }
}

class PlaceTile extends StatelessWidget {
  final Region region;
  final Place place;

  PlaceTile({Key key, @required this.region, this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlaceCityTile(place: place);
  }
}

class PlaceCityTile extends StatelessWidget {
  final Place place;

  PlaceCityTile({Key key, @required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: () {
          //  Share.share("I had dim sum at ${place.name} in ${place.city} #dimsum #yumcha //#talkdimsum talkdimsum.com", subject: "Talk Dim Sum");
        },
        child: Text(place.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            )));
    // subtitle: Text(place.city),
  }
}
