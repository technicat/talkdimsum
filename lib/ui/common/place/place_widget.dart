/* Technicat LLC */

import 'package:flutter/widgets.dart';

import 'package:talkdimsum/core/model/place.dart';

class PlaceWidget extends StatelessWidget {
  final Place place;

  PlaceWidget({Key? key, required this.place}) : super(key: key);

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
