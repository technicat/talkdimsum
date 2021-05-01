import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/core/provider/settings.dart';

import 'package:talkdimsum/core/provider/stt.dart';

import 'package:fluttertoast/fluttertoast.dart';

class STTButton extends StatelessWidget {
  final Word word;

  STTButton({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(
        builder: (context, settings, child) => Consumer<STT>(
            builder: (context, stt, child) => stt.status == STTStatus.Listening
                ? MaterialButton(
                    child: Icon(Icons.pause),
                    onPressed: () {
                      stt.stop();
                    },
                  )
                : MaterialButton(
                    child: Icon(Icons.mic),
                    onPressed: () {
                      try {
                        stt.listen(word, settings.language);
                      } catch (e) {
                        Fluttertoast.showToast(
                            msg: e.toString(),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                  )));
  }
}
