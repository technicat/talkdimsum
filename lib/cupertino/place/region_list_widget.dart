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
    return Center(child: ListView(
      children:
          country.regions.map((place) => _placeTile(context, place)).toList()));
          }

  ListTile _placeTile(BuildContext context, Region region) => ListTile(
        title: Text(region.name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
            onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaceListWidget(region: region)),
                  );
                },
          subtitle: region.places.length != 1 ? 
            Text('${region.places.length} restaurants') :
            Text('${region.places.length} restaurant'),
       /* leading: Icon(
          icon,
          color: Colors.blue[500],
        ), */
      );
}
