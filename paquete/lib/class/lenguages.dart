class Languages {
  String iso_1;
  String iso_2;
  String name;
  String nativeName;

  Languages(
      {required this.iso_1,
      required this.iso_2,
      required this.name,
      required this.nativeName});

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
      iso_1     : json["iso639_1"],
      iso_2     : json["iso639_2"],
      name      : json["name"],
      nativeName: json["nativeName"]);

  Map<String, dynamic> toJson() =>
      {
        'iso639_1'     : iso_1, 
        'iso639_2'     : iso_2, 
        'name'      : name, 
        'nativeName': nativeName};
}
