class Translations {
  String br;
  String pt;
  String nl;
  String hr;
  String fa;
  String de;
  String es;
  
  Translations(
      {required this.br,
      required this.pt,
      required this.nl,
      required this.hr,
      required this.fa,
      required this.de,
      required this.es});

  factory Translations.fromJson(Map<String, dynamic> json) => Translations(
      br: json["br"],
      pt: json["pt"],
      nl: json["nl"],
      hr: json["hr"],
      fa: json["fa"],
      de: json["de"],
      es: json["es"]);

  Map<String, dynamic> toJson() => {
    br: "br",
    pt: "pt",
    nl: "nl",
    hr: "hr",
    fa: "fa",
    de: "de",
    es: "es"
  };
}
