/* Technicat LLC */

import 'package:flutter/material.dart';

import 'package:talkdimsum/core/country.dart';

import 'region_list_widget.dart';

class ScaffoldCountryWidget extends StatefulWidget {
  
  // Country country = Country.countries[0];

@override
  ScaffoldCountryState createState() => ScaffoldCountryState();
}

class ScaffoldCountryState extends State<ScaffoldCountryWidget> {

   Country country = Country.countries[0];

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        appBar: 
          AppBar(
            title: Text(country.name),
             actions: <Widget>[
                PopupMenuButton<Country>(
                    icon: Icon(Icons.public),
                    onSelected: (value) {
                      setState(() { country = value; });
                    },
                    itemBuilder: (BuildContext context) => 
                        Country.countries.map((country) => PopupMenuItem<Country>(value: country, child: Text(country.name))).toList(),

                ),
          ]
              ),
        body: RegionListWidget(country: country),
       
    );
  }

}

