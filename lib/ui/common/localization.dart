import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'de_DE': {
          'title': 'Dim Sum Reden',
          'search': 'Suchen',
          'favorites': 'Favoriten'
        },
        'en_US': {
          'title': 'Talk Dim Sum',
          'favorites': 'Favorites',
          'search': 'Search',
        },
        'es_MX': {
          'title': 'Hablar Dim Sum',
          'search': 'Buscar',
          'favorites': 'Favoritos'
        },
        'fr_FR': {
          'title': 'Parler Dim Sum',
          'search': 'Recherche',
        },
        'it_IT': {
          'title': 'Parlere Dim Sum',
          'search': 'Recirca',
        },
        'pt_PT': {
          'title': 'Falar Dim Sum',
          'search': 'Buscar',
        },
      };
}
