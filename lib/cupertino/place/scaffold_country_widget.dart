/* Technicat LLC */

import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/country.dart';

import 'region_list_widget.dart';

class ScaffoldCountryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Places'),
        ),
        child: RegionListWidget(country: Country.countries[0]));
  }
}
