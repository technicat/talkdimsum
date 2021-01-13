import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:talkdimsum/core/model/language.dart';

import 'package:talkdimsum/core/provider/settings.dart';

class LanguageDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(builder: (context, settings, child) {
      return DropdownButton<Chinese>(
        icon: Icon(Icons.language),
        value: settings.language,
        onChanged: (value) {
          settings.language = value;
        },
        // should map Chinese.values
        items: Chinese.values.map((value) => 
          DropdownMenuItem<Chinese>(
            value: value, child: Text(settings.languageName(value))))
      .toList());
    }
    );
  }
}

