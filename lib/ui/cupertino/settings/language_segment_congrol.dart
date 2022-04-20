import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:talkdimsum/core/model/language.dart';
import 'package:talkdimsum/core/provider/settings.dart';

class LanguageSegmentControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(
        builder: (context, settings, child) =>
            CupertinoSegmentedControl<Chinese>(
              groupValue: settings.language,
              onValueChanged: (value) => settings.language = value,
              children: {
                for (var v in Chinese.values) v: Text(describeEnum(v))
              },
            ));
  }
}
