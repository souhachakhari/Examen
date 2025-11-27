import '../models/country.dart';

List<Country> getCountries() {
  return [
    Country(
      nom: 'France',
      capitale: 'Paris',
      population: '67 millions',
      superficie: '643 801 km²',
      langues: 'Français',
    ),
    Country(
      nom: 'Tunisie',
      capitale: 'Tunis',
      population: '12 millions',
      superficie: '163 610 km²',
      langues: 'Arabe',
    ),
    Country(
      nom: 'Brésil',
      capitale: 'Brasília',
      population: '215 millions',
      superficie: '8 515 767 km²',
      langues: 'Portugais',
    ),
    Country(
      nom: 'Italie',
      capitale: 'Rome',
      population: '59 millions',
      superficie: '301 340 km²',
      langues: 'Italien',
    ),
    Country(
      nom: 'Canada',
      capitale: 'Ottawa',
      population: '39 millions',
      superficie: '9 984 670 km²',
      langues: 'Anglais',
    ),
    Country(
      nom: 'Australie',
      capitale: 'Canberra',
      population: '26 millions',
      superficie: '7 692 024 km²',
      langues: 'Anglais',
    ),
    Country(
      nom: 'Allemagne',
      capitale: 'Berlin',
      population: '84 millions',
      superficie: '357 022 km²',
      langues: 'Allemand',
    ),
    Country(
      nom: 'Espagne',
      capitale: 'Madrid',
      population: '47 millions',
      superficie: '505 990 km²',
      langues: 'Espagnol',
    ),
    Country(
      nom: 'Afrique du Sud',
      capitale: 'Pretoria',
      population: '60 millions',
      superficie: '1 219 090 km²',
      langues: 'Afrikaans',
    ),
  ];
}

// Fonction pour obtenir l'emoji du drapeau d'un pays
String getFlagEmoji(String countryName) {
  final flags = {
    'France': '🇫🇷',
    'Tunisie': '🇹🇳',
    'Brésil': '🇧🇷',
    'Italie': '🇮🇹',
    'Canada': '🇨🇦',
    'Australie': '🇦🇺',
    'Allemagne': '🇩🇪',
    'Espagne': '🇪🇸',
    'Afrique du Sud': '🇿🇦',
  };
  return flags[countryName] ?? '🌍';
}