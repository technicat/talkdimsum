import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';

import 'package:talkdimsum/core/provider/stt.dart';

class STTStatusText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<STT>(builder: (context, stt, child) {
      switch (stt.status) {
        case STTStatus.Listening:
          {
            return Text('Listening...',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24));
          }
          {
            return Text('Correct!',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24));
          }
        case STTStatus.Mismatch:
          {
            return Text('Wrong!',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24));
          }
        case STTStatus.Stopped:
          {
            return Text('',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24));
          }
        default:
          {
            return Text(stt.lastStatus,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24));
          }
      }
    });
  }
}
