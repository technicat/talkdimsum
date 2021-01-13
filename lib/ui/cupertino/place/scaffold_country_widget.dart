/* Technicat LLC */

import 'package:flutter/cupertino.dart';

import 'country_widget.dart';

class ScaffoldCountryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Places'),
        ),
        child: CountryWidget());
  }
}
