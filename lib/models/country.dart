class Country {
  final String nom;
  final String capitale;
  final String population; // String as per spec (int or String)
  final String superficie; // String as per spec (int or String)
  final String langues; // langue(s) as String

  Country({
    required this.nom,
    required this.capitale,
    required this.population,
    required this.superficie,
    required this.langues,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      nom: json['nom'] ?? '',
      capitale: json['capitale'] ?? '',
      population: json['population'] ?? '',
      superficie: json['superficie'] ?? '',
      langues: json['langues'] ?? '', // or 'langue' if singular in JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'capitale': capitale,
      'population': population,
      'superficie': superficie,
      'langues': langues,
    };
  }
}