import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/core/provider/settings.dart';

import 'package:talkdimsum/core/provider/stt.dart';

class STTButton extends StatelessWidget {
  final Word word;

  STTButton({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<Settings>(
      builder: (context, settings, child) => Consumer<STT>(
          builder: (context, stt, child) => stt.status == STTStatus.listening
              ? MaterialButton(
                  onPressed: () => stt.stop(),
                  child:
                      Icon(Icons.pause, semanticLabel: 'Stop listening to me'),
                )
              : MaterialButton(
                  onPressed: () {
                    try {
                      stt.listen(word, settings.language);
                    } catch (e) {
                      Get.snackbar('Speech-to-text error', e.toString(),
                          backgroundColor: Colors.white,
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                  child:
                      Icon(Icons.mic, semanticLabel: 'Start listening to me'),
                )));
}
