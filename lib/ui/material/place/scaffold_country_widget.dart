/* Technicat LLC */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/model/country.dart';
import 'package:talkdimsum/core/provider/countries.dart';

import 'region_list_view.dart';

class ScaffoldCountryWidget extends StatefulWidget {
  @override
  ScaffoldCountryState createState() => ScaffoldCountryState();
}

class ScaffoldCountryState extends State<ScaffoldCountryWidget> {
  Country country;

  @override
  Widget build(BuildContext context) {
    return Consumer<Countries>(builder: (context, countries, child) {
      if (countries.countries.isEmpty) {
        return Center(child: CircularProgressIndicator());
      } else {
        if (country == null) {
          country = countries.countries[0];
        }
        return Scaffold(
            appBar: AppBar(title: Text(country.name), actions: <Widget>[
              PopupMenuButton<Country>(
                icon: Icon(Icons.public),
                onSelected: (value) {
                  setState(() {
                    country = value;
                  });
                },
                itemBuilder: (BuildContext context) => countries.countries
                    .map((country) => PopupMenuItem<Country>(
                        value: country, child: Text(country.name)))
                    .toList(),
              )
            ]),
            body: RegionListView(country: country));
      }
    });
  }
}
