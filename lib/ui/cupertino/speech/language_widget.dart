import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

import 'package:talkdimsum/core/provider/settings.dart';

class LanguageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(builder: (context, settings, child) {
      return CupertinoSegmentedControl<Chinese>(
        groupValue: settings.language,
        onValueChanged: (value) {
          settings.language = value;
        },
        children: {
          // should map Chinese.values
          Chinese.Cantonese: Text("Cantonese"),
          Chinese.Mandarin: Text("Mandarin"),
          Chinese.Simplified: Text("Simplified")
        },
      );
    });
  }
}
