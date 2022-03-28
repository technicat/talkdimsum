/* Technicat LLC */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:talkdimsum/core/model/region.dart';
import 'package:talkdimsum/core/model/country.dart';

import 'place_list_widget.dart';

class RegionListView extends StatelessWidget {
  final Country country;

  RegionListView({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
      child: ListView(
          children: country.regions
              .map((region) => RegionTile(region: region))
              .toList()));
}

class RegionTile extends StatelessWidget {
  final Region region;

  RegionTile({Key? key, required this.region}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(region.name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        onTap: () => Get.to(() => PlaceScaffold(region: region)),
        subtitle: region.places.length != 1
            ? Text('${region.places.length} restaurants')
            : Text('${region.places.length} restaurant'),
        /* leading: Icon(
          icon,
          color: Colors.blue[500],
        ), */
      );
}
