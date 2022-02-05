/* Technicat LLC */

import 'package:flutter/cupertino.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/provider/countries.dart';
import 'package:talkdimsum/ui/common/error_text.dart';

import 'regions_list_view.dart';

class CountryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return ref.watch(countryProvider).map(
          data: (_) => _.value.countries.isEmpty
              ? CupertinoActivityIndicator()
              : RegionsListView(country: _.value.countries[0]),
          loading: (_) => LoadingText(),
          error: (_) => ErrorText(error: _.error));
    });
  }
}
