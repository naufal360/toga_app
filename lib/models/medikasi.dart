import 'dart:convert';

List<Medikasi> medikasiFromJson(String str) =>
    List<Medikasi>.from(json.decode(str).map((x) => Medikasi.fromJson(x)));

String medikasiToJson(List<Medikasi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Medikasi {
  Medikasi({
    required this.id,
    required this.name,
    required this.description,
    required this.material,
    required this.make,
    required this.consume,
    required this.moreAbout,
    required this.v,
  });

  int id;
  String name;
  String description;
  List<String> material;
  String make;
  String consume;
  String moreAbout;
  int v;

  factory Medikasi.fromJson(Map<String, dynamic> json) => Medikasi(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        material: List<String>.from(json["material"].map((x) => x)),
        make: json["make"],
        consume: json["consume"],
        moreAbout: json["moreAbout"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "material": List<dynamic>.from(material.map((x) => x)),
        "make": make,
        "consume": consume,
        "moreAbout": moreAbout,
        "__v": v,
      };
}
