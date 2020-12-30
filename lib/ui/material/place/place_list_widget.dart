/* Technicat LLC */

import 'package:flutter/material.dart';
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
   return Material(child: ListView(
      children:
          region.places.map((place) => PlaceTile(region: region, place: place)).toList()));
  }

}

class PlaceTile extends StatelessWidget {

  final Region region;
  final Place place;

  PlaceTile({Key key, @required this.region, this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        switch (value) {
          case "share": {
            Share.share("I had dim sum at ${place.name} in ${place.city} #dimsum #yumcha #talkdimsum talkdimsum.com", subject: "Talk Dim Sum");
            }
            break;
          default: {
              launch(value);
            }
          }
      },
      itemBuilder: (BuildContext context) { 
                    List<PopupMenuEntry<String>> menu = [];
                    menu.add(PopupMenuItem<String>(
                              value: sprintf("https://www.google.com/maps/search/?api=1&query=%2.2f,%2.2f",[place.lat,place.lon]),
                              child: Text('map'),
                              )); 
                    menu.add(PopupMenuItem<String>(
                              value: "share",
                              child: Text('share'),
                              ));
                    menu.addAll(place.links.map((link) => PopupMenuItem<String>(value: link.URL, child: Text(link.name))));
                    return menu;
      },
      child: PlaceCityTile(place: place));
      }
}

class PlaceCityTile extends StatelessWidget {

  final Place place;

  PlaceCityTile({Key key, @required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return ListTile(
        title: Text(place.name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
         subtitle: Text(place.city),
      );
      }
}
