/* Technicat LLC */

import 'package:flutter/cupertino.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/provider/countries.dart';

import 'regions_list_view.dart';

class CountryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      var countries = watch(countryProvider);
      return countries.map(
          data: (_) {
            return _.value.countries.isEmpty
                ? CupertinoActivityIndicator()
                : RegionsListView(country: _.value.countries[0]);
          },
          loading: (_) => CupertinoActivityIndicator(),
          error: (_) => Text(
                _.error.toString(),
                style: TextStyle(color: CupertinoColors.destructiveRed),
              ));
    });
  }
}
