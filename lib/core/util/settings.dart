/* Technicat LLC */

class Settings {
  static Chinese language = Chinese.Cantonese;

  static double speed = 1.0;

  static String languageName(Chinese language) {
    switch (language) {
      case Chinese.Cantonese:
        return "Cantonese";
      case Chinese.Mandarin:
        return "Mandarin";
      case Chinese.Simplified:
        return "Simplified";
      default:
        return "Cantonese";
    }
  }
}

enum Chinese {
  Cantonese,
  Mandarin,
  Simplified,
}
