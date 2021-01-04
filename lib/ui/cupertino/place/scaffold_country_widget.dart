/* Technicat LLC */

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/country.dart';

import 'region_list_widget.dart';

class ScaffoldCountryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Places'),
        ),
        child: Consumer<Countries>(builder: (context, countries, child) {
          return countries.countries.isEmpty
              ? Text('Loading countries...')
              : RegionListWidget(country: countries.countries[0]);
        }));
  }
}
