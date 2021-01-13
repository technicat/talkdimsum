/* Technicat LLC */

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/provider/countries.dart';

import 'region_list_widget.dart';

class CountryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Countries>(
        builder: (context, countries, child) => countries.countries.isEmpty
            ? CupertinoActivityIndicator()
            : RegionListWidget(country: countries.countries[0]));
  }
}
