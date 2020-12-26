/* Technicat LLC */

class Settings {
  static Language language = Language.Cantonese;

  static double speed = 1.0;

  static String languageName(Language language) {
    switch (language) {
      case Language.Cantonese: return "Cantonese";
      case Language.Mandarin: return "Mandarin";
      case Language.Simplified: return "Simplified";
      default: return "Cantonese";
    }
  }

  }

// rename to Chinese?
enum Language {
  Cantonese,
  Mandarin,
  Simplified,
 // English,
}
