/* Technicat LLC */

import 'package:flutter/cupertino.dart';
import 'package:talkdimsum/core/model/place.dart';
import 'package:talkdimsum/core/model/region.dart';
import 'package:talkdimsum/ui/common/place/place_widget.dart';

class PlaceRow extends StatelessWidget {
  final Region region;
  final Place place;

  PlaceRow({Key? key, required this.region, required this.place})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var share = CupertinoActionSheetAction(
        onPressed: () => place.share(), child: Text('share'));
    var map = CupertinoActionSheetAction(
        onPressed: () => place.showGoogleMap(), child: Text('map'));
    return CupertinoButton(
        onPressed: () {
          showCupertinoModalPopup(
              context: context,
              builder: (_) => CupertinoActionSheet(
                      title: Text(place.name),
                      message: Text(place.address),
                      actions: [
                        share,
                        map,
                        ...place.links.map((link) => CupertinoActionSheetAction(
                            onPressed: () => link.goto(),
                            child: Text(link.name)))
                      ]));
        },
        child: PlaceWidget(place: place));
  }
}
