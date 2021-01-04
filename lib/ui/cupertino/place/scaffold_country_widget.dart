/* Technicat LLC */

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/model/country.dart';
import 'package:talkdimsum/core/provider/countries.dart';


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
              ? CupertinoActivityIndicator()
              : RegionListWidget(country: countries.countries[0]);
        }));
  }
}
