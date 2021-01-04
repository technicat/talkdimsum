/* Technicat LLC */

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/dimsum.dart';

import 'region_list_widget.dart';

class ScaffoldCountryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Places'),
        ),
        child: Consumer<DimSum>(builder: (context, dimsum, child) {
          return dimsum.countries.isEmpty
              ? Text('Loading countries...')
              : RegionListWidget(country: dimsum.countries[0]);
        }));
  }
}
