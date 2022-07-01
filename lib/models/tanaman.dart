import 'dart:convert';

List<Tanaman> tanamanFromJson(String str) =>
    List<Tanaman>.from(json.decode(str).map((x) => Tanaman.fromJson(x)));

String tanamanToJson(List<Tanaman> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tanaman {
  Tanaman({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.latinName,
    required this.family,
    required this.description,
    required this.goodPart,
    required this.efficacy,
    required this.v,
  });

  int id;
  String imageUrl;
  String name;
  String latinName;
  String family;
  String description;
  String goodPart;
  List<String> efficacy;
  int v;

  factory Tanaman.fromJson(Map<String, dynamic> json) => Tanaman(
        id: json["_id"],
        imageUrl: json["imageUrl"],
        name: json["name"],
        latinName: json["latinName"],
        family: json["family"],
        description: json["description"],
        goodPart: json["goodPart"],
        efficacy: List<String>.from(json["efficacy"].map((x) => x)),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "imageUrl": imageUrl,
        "name": name,
        "latinName": latinName,
        "family": family,
        "description": description,
        "goodPart": goodPart,
        "efficacy": List<dynamic>.from(efficacy.map((x) => x)),
        "__v": v,
      };
}
