/* Technicat LLC */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/model/country.dart';
import 'package:talkdimsum/core/provider/countries.dart';

import 'package:talkdimsum/ui/common/error_text.dart';

import 'region_list_view.dart';

import '../progress.dart';

class CountryScaffold extends StatefulWidget {
  @override
  CountryScaffoldState createState() => CountryScaffoldState();
}

class CountryScaffoldState extends State<CountryScaffold> {
  Country? country;

  @override
  Widget build(BuildContext context) =>
      Consumer(builder: (context, ref, child) {
        var countries = ref.watch(countryProvider);
        return countries.map(
            data: (_) {
              if (_.value.countries.isEmpty) {
                return Progressor();
              } else {
                country ??= _.value.countries[0];
                return Scaffold(
                    appBar:
                        AppBar(title: Text(country!.name), actions: <Widget>[
                      PopupMenuButton<Country>(
                        icon: Icon(Icons.public),
                        onSelected: (value) {
                          setState(() {
                            country = value;
                          });
                        },
                        itemBuilder: (BuildContext context) => _.value.countries
                            .map((country) => PopupMenuItem<Country>(
                                value: country, child: Text(country.name)))
                            .toList(),
                      )
                    ]),
                    body: RegionListView(country: country!));
              }
            },
            loading: (_) => Scaffold(
                appBar: AppBar(title: Text('Places')), body: Progressor()),
            error: (_) => Scaffold(
                appBar: AppBar(title: Text('Places')),
                body: ErrorText(error: _.error.toString())));
      });
}
