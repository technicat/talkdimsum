/* Technicat LLC */

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:talkdimsum/core/model/place.dart';
import 'package:talkdimsum/core/model/region.dart';

class PlaceScaffold extends StatelessWidget {
  final Region region;

  PlaceScaffold({Key? key, required this.region}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(region.name)),
      body: PlaceList(region: region));
}

class PlaceList extends StatelessWidget {
  final Region region;

  PlaceList({Key? key, required this.region}) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
      child: ListView(
          children: region.places
              .map((place) => PlaceTile(region: region, place: place))
              .toList()));
}

class PlaceTile extends StatelessWidget {
  final Region region;
  final Place place;

  PlaceTile({Key? key, required this.region, required this.place})
      : super(key: key);

  @override
  Widget build(BuildContext context) => PopupMenuButton<String>(
      onSelected: (String value) {
        switch (value) {
          case 'share':
            {
              place.share();
            }
            break;
          case 'map':
            {
              place.showGoogleMap();
            }
            break;
          default:
            {
              launch(value);
            }
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'map',
            child: Text('map'),
          ),
          PopupMenuItem<String>(
            value: 'share',
            child: Text('share'),
          ),
          ...place.links.map((link) =>
              PopupMenuItem<String>(value: link.url, child: Text(link.name)))
        ];
      },
      child: PlaceCityTile(place: place));
}

class PlaceCityTile extends StatelessWidget {
  final Place place;

  PlaceCityTile({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(place.name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        subtitle: Text(place.city),
      );
}
