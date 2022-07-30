import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:talkdimsum/core/provider/settings.dart';

class SpeedSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(builder: (context, settings, child) {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        // Icon(Icons.tortoise),
        Slider(
          min: 0.1,
          max: 1.9,
          value: settings.speed,
          onChanged: (value) => settings.speed = value,
        ),
        //  Icon(CupertinoIcons.hare)
      ]);
    });
  }
}
