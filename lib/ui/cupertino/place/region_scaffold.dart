/* Technicat LLC */

import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/place.dart';
import 'package:talkdimsum/core/model/region.dart';

class RegionScaffold extends StatelessWidget {
  final Region region;

  RegionScaffold({Key key, @required this.region}) : super(key: key);

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
    var share = CupertinoActionSheetAction(
        onPressed: () {
          place.share();
        },
        child: Text('share'));
    var map = CupertinoActionSheetAction(
        onPressed: () {
          place.showGoogleMap();
        },
        child: Text('map'));
    var actions = [share, map];
    actions.addAll(place.links
        .map((link) => CupertinoActionSheetAction(
            onPressed: () {
              link.goto();
            },
            child: Text(link.name)))
        .toList());
    return CupertinoButton(
        onPressed: () {
          showCupertinoModalPopup(
              context: context,
              builder: (_) => CupertinoActionSheet(
                  title: Text(place.name),
                  message: Text(place.address),
                  actions: actions
                  /* cancelButton: CupertinoActionSheetAction(
                        onPressed: () {
                         // Navigator.pop(context);
                        },
                        child: Text('Cancel')*/
                  ));
        },
        child: PlaceWidget(place: place));
  }
}

class PlaceWidget extends StatelessWidget {
  final Place place;

  PlaceWidget({Key key, @required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(place.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          )),
      Text(place.city,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ))
    ]);
  }
}
