import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:talkdimsum/core/provider/stt.dart';

class STTStatusText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<STT>(builder: (context, stt, child) {
      switch (stt.status) {
        case STTStatus.listening:
          {
            return Text('Listening...',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24));
          }
        case STTStatus.match:
          {
            return Text('Correct!',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24));
          }
        case STTStatus.mismatch:
          {
            return Text('Wrong!',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24));
          }
        case STTStatus.stopped:
          {
            return Text('',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24));
          }
        case STTStatus.error:
          {
            return Text(stt.lastError,
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
