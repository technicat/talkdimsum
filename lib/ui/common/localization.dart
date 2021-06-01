import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'de_DE': tr_de,
        'de_US': tr_de,
        'en_UK': tr_us,
        'en_US': tr_us,
        'es_ES': tr_es,
        'es_MX': tr_es,
        'es_US': tr_es,
        'fr_CA': tr_fr,
        'fr_FR': tr_fr,
        'fr_US': tr_fr,
        'it_IT': tr_it,
        'it_US': tr_it,
        'pt_PT': tr_pt,
        'pt_US': tr_pt,
      };
}

var tr_de = {
  'title': 'Dim Sum Reden',
  'search': 'Suchen',
  'favorites': 'Favoriten',
  'phrases': 'Sätze',
  'places': 'Setzt',
};

var tr_es = {
  'title': 'Hablar Dim Sum',
  'search': 'Buscar',
  'favorites': 'Favoritos',
  'phrases': 'Frases',
  'places': 'Lugares',
};

var tr_fr = {
  'title': 'Parler Dim Sum',
  'search': 'Recherche',
  'favorites': 'Favoris',
  'phrases': 'Phrases',
  'places': 'Des endroits',
};

var tr_it = {
  'title': 'Parlere Dim Sum',
  'search': 'Recirca',
  'favorites': 'Preferiti',
  'phrases': 'Frasi',
  'places': 'Posti',
};

var tr_pt = {
  'title': 'Falar Dim Sum',
  'search': 'Buscar',
  'favorites': 'Favoritos',
  'phrases': 'Frases',
  'places': 'Locais',
};

var tr_us = {
  'title': 'Talk Dim Sum',
  'favorites': 'Favorites',
  'search': 'Search',
  'phrases': 'Phrases',
  'places': 'Places',
};
