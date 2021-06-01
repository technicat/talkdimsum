import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'title': 'Talk Dim Sum',
          'search': 'Search',
        },
        'de_DE': {
          'title': 'Dim Sum Reden',
            'search': 'Suche',
        }
      };
}
