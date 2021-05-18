/* Technicat LLC */

import 'package:flutter/cupertino.dart';

import 'country_widget.dart';

class CountryScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Places'),
      ),
      child: CountryWidget());
}
