import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';

import 'package:talkdimsum/core/model/word.dart';

import 'package:talkdimsum/ui/common/stt/stt_text.dart';
import 'package:talkdimsum/ui/common/stt/stt_status_text.dart';

import 'stt_button.dart';

class STTWidget extends StatelessWidget {
  final Word word;

  STTWidget({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      STTStatusText(),
      STTText(),
      STTButton(word: word),
      // todo - add link to Google app to install/enable
      MaterialButton(
        onPressed: () => AppSettings.openAppSettings(),
        child: Text('Permissions'),
      )
    ]);
  }
}
