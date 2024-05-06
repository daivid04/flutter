class Currencies {
  String code;
  String name;
  String symbol;

  Currencies({required this.code, required this.name, required this.symbol});

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
      code: json["code"], name: json["name"], symbol: json["symbol"]);

  Map<String, dynamic> toJson() =>
      {"code": code, "name": name, "symbol": symbol};
}
