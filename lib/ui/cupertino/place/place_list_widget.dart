/* Technicat LLC */

import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';
import 'package:sprintf/sprintf.dart';
import 'package:url_launcher/url_launcher.dart';

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
    var actions = place.links
                        .map((link) => CupertinoActionSheetAction(
                            onPressed: () {
                              launch(link.URL);
                            },
                            child: Text(link.name)))
                        .toList();
    var share = CupertinoActionSheetAction(
                            onPressed: () {
                Share.share("I had dim sum at ${place.name} in ${place.city} #dimsum #yumcha #talkdimsum talkdimsum.com", subject: "Talk Dim Sum");
                            },
                            child: Text('share'));
    var map = CupertinoActionSheetAction(
                            onPressed: () {
                              launch(sprintf("https://www.google.com/maps/search/?api=1&query=%2.2f,%2.2f",[place.lat,place.lon]));
                            },
                            child: Text('map'));
    actions.add(share);
    actions.add(map);
    return CupertinoButton(
        onPressed: () {
          showCupertinoModalPopup(
              context: context,
              builder: (_) {
                return CupertinoActionSheet(
                    title: Text(place.name),
                    message: Text(place.address),
                    actions: actions
                    /* cancelButton: CupertinoActionSheetAction(
                        onPressed: () {
                         // Navigator.pop(context);
                        },
                        child: Text('Cancel')*/
                    );
              });
        },
        child: Column(children: [
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
        ]));
  }
}
