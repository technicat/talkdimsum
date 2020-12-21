/* Technicat LLC */

import 'package:flutter_tts/flutter_tts.dart';

import 'word.dart';
import 'settings.dart';

class Speech {
  static FlutterTts flutterTts = FlutterTts();
  // flutterTts.setLanguage("en-US");
  // flutterTts.setLanguage("zh-Hant");

 /* static Language language = Language.Cantonese;

  static String currentLocale() {
    return locale(language);
  } */

  static String locale(Language lang) {
    switch (lang) {
      case Language.Cantonese: return "yue-HK";
      case Language.Mandarin: return "zh-TW";
      case Language.Simplified: return "zh-CN";
     // case Language.English: return "en-US";
    }
  }

   static Future sayText(String text, Language lang, double speed) async{
    await flutterTts.setSpeechRate(speed); // do these in setters?
    await flutterTts.setLanguage(locale(lang));
    var result = await flutterTts.speak(text);
    if (result == 1) {
      print("speaking...");
    //setState(() => ttsState = TtsState.playing);
     } else {
      print("didn't speak for some reason");
      }
   }

   static Future sayWord(Word word, Language lang, double speed) async{
    await sayText(word.chineseText(lang),lang,speed);
   }

  }

/*
   Future _speak(String locale) async{
  //   print(await Speech.flutterTts.getLanguages);
      if (!await Speech.flutterTts.isLanguageAvailable(locale)) {
      final snackBar = SnackBar(
            content: Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change!
              },
            ),
          );

          // Find the Scaffold in the Widget tree and use it to show a SnackBar!
          //Scaffold.of(context).showSnackBar(snackBar);
      } else { 
   // await Speech.flutterTts.setLanguage(locale);
    var result = await Speech.speak(speechText(locale));
   // if (result == 1) setState(() => ttsState = TtsState.playing);
     }
   }

   } */

/*
   [ko-KR, ru-RU, zh-TW, hu-HU, th-TH, nb-NO, da-DK, tr-TR, et-EE, bs, sw, vi-VN, en-US, sv-SE, su-ID, bn-BD, sk, el-GR, hi-IN, fi-FI, km-KH, bn-IN, fr-FR, uk-UA, en-AU, nl-NL, fr-CA, sr, pt-BR, si-LK, de-DE, ku, cs-CZ, pl-PL, sk-SK, fil-PH, it-IT, ne-NP, hr, zh-CN, es-ES, cy, ja-JP, sq, yue-HK, en-IN, es-US, jv-ID, la, id-ID, ro-RO, ca, ta, en-GB]
   */