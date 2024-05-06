// ignore_for_file: non_constant_identifier_names, file_names

class Regional {
  String acronym;
  String name;
  List<String>? otherAcronym;
  List<String> otherNames;

  Regional(
      {required this.acronym,
      required this.name,
      this.otherAcronym,
      required this.otherNames});

  factory Regional.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('otherAcronym') == true) {
      return Regional(
          acronym: json["acronym"],
          name: json["name"],
          otherAcronym: List<String>.from(json['otherAcronym']),
          otherNames: List<String>.from(json["otherNames"]));
    }
    return Regional(
        acronym: json["acronym"],
        name: json["name"],
        otherNames: List<String>.from(json["otherNames"]));
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {'acronym': acronym, 'name': name};
    if (otherAcronym != null) {
      json.addAll({'otherAcronym' : otherAcronym});
    }
    json.addAll({'otherNames' : otherNames});
    return json;
  }
}
