/* Technicat LLC */

import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/place.dart';
import 'package:talkdimsum/core/model/region.dart';

import 'package:talkdimsum/ui/common/place/place_widget.dart';

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
                    .map((place) => PlaceRow(region: region, place: place))
                    .toList())));
  }
}

class PlaceRow extends StatelessWidget {
  final Region region;
  final Place place;

  PlaceRow({Key key, @required this.region, this.place}) : super(key: key);

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