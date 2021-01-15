/* Technicat LLC */

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/provider/countries.dart';

import 'regions_list_view.dart';

class CountryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Countries>(
        builder: (context, countries, child) => countries.countries.isEmpty
            ? CupertinoActivityIndicator()
            : RegionsListView(country: countries.countries[0]));
  }
}
