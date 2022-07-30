import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:talkdimsum/core/provider/stt.dart';

class STTText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<STT>(
        builder: (context, stt, child) => Text(stt.lastWords,
            textAlign: TextAlign.center, style: TextStyle(fontSize: 24)));
  }
}
