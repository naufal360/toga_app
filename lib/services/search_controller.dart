import 'package:dio/dio.dart';

class TanamanBaru {
  int id;
  String imageUrl;
  String name;
  String latinName;
  String family;
  String description;
  String goodPart;
  List<String> efficacy;
  String articles;
  List<String> contained;
  String youtube;

  TanamanBaru({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.latinName,
    required this.family,
    required this.description,
    required this.goodPart,
    required this.efficacy,
    required this.articles,
    required this.contained,
    required this.youtube,
  });
}

class TanamanBaruDynamic {
  int id;
  String imageUrl;
  String name;
  String latinName;
  String family;
  String description;
  String goodPart;
  List<dynamic> efficacy;
  String articles;
  List<dynamic> contained;
  String youtube;

  TanamanBaruDynamic({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.latinName,
    required this.family,
    required this.description,
    required this.goodPart,
    required this.efficacy,
    required this.articles,
    required this.contained,
    required this.youtube,
  });
}

class MedikasiBaru {
  int id;
  String name;
  String description;
  List<String> material;
  String make;
  String consume;
  String moreAbout;

  MedikasiBaru({
    required this.id,
    required this.name,
    required this.description,
    required this.material,
    required this.make,
    required this.consume,
    required this.moreAbout,
  });
}

class MedikasiBaruDynamic {
  int id;
  String name;
  String description;
  List<dynamic> material;
  String make;
  String consume;
  String moreAbout;

  MedikasiBaruDynamic({
    required this.id,
    required this.name,
    required this.description,
    required this.material,
    required this.make,
    required this.consume,
    required this.moreAbout,
  });
}

Future<List<TanamanBaru>> getSearching(String word) async {
  var request = await Dio().get("http://pi-toga.herokuapp.com/api/tanaman/get");
  try {
    List<TanamanBaru> buckets = [];
    var response = request.data.map((data) {
      return TanamanBaruDynamic(
        id: data["_id"],
        imageUrl: data["imageUrl"],
        name: data["name"],
        latinName: data["latinName"],
        family: data["family"],
        description: data["description"],
        goodPart: data["goodPart"],
        efficacy: data["efficacy"],
        articles: data["articles"],
        contained: data["contained"],
        youtube: data["youtube"],
      );
    }).toList();
    for (var i = 0; i < response.length; i++) {
      List<String> efficacies = [];
      for (var j = 0; j < response[i].efficacy.length; j++) {
        efficacies.add(response[i].efficacy[j].toString());
      }
      List<String> contains = [];
      for (var y = 0; y < response[i].contained.length; y++) {
        contains.add(response[i].contained[y].toString());
      }
      buckets.add(TanamanBaru(
        id: response[i].id,
        imageUrl: response[i].imageUrl,
        name: response[i].name,
        latinName: response[i].latinName,
        family: response[i].family,
        description: response[i].description,
        goodPart: response[i].goodPart,
        efficacy: efficacies,
        articles: response[i].articles,
        contained: contains,
        youtube: response[i].youtube,
      ));
    }
    return buckets
        .where((element) => element.name.toLowerCase().contains(word))
        .toList();
  } catch (e) {
    throw Exception(e);
  }
}

Future<List<TanamanBaru>> getAllData() async {
  var request = await Dio().get("http://pi-toga.herokuapp.com/api/tanaman/get");
  try {
    List<TanamanBaru> buckets = [];
    var response = request.data.map((data) {
      return TanamanBaruDynamic(
        id: data["_id"],
        imageUrl: data["imageUrl"],
        name: data["name"],
        latinName: data["latinName"],
        family: data["family"],
        description: data["description"],
        goodPart: data["goodPart"],
        efficacy: data["efficacy"],
        articles: data["articles"],
        contained: data["contained"],
        youtube: data["youtube"],
      );
    }).toList();
    for (var i = 0; i < response.length; i++) {
      List<String> efficacies = [];
      for (var j = 0; j < response[i].efficacy.length; j++) {
        efficacies.add(response[i].efficacy[j].toString());
      }
      List<String> contains = [];
      for (var y = 0; y < response[i].contained.length; y++) {
        contains.add(response[i].contained[y].toString());
      }
      buckets.add(TanamanBaru(
        id: response[i].id,
        imageUrl: response[i].imageUrl,
        name: response[i].name,
        latinName: response[i].latinName,
        family: response[i].family,
        description: response[i].description,
        goodPart: response[i].goodPart,
        efficacy: efficacies,
        articles: response[i].articles,
        contained: contains,
        youtube: response[i].youtube,
      ));
    }
    return buckets;
  } catch (e) {
    throw Exception(e);
  }
}

Future<List<MedikasiBaru>> getSearchingMed(String word) async {
  var request =
      await Dio().get("http://pi-toga.herokuapp.com/api/medikasi/get");
  try {
    List<MedikasiBaru> buckets = [];
    var response = request.data.map((data) {
      return MedikasiBaruDynamic(
        id: data["_id"],
        name: data["name"],
        description: data["description"],
        material: data["material"],
        make: data["make"],
        consume: data["consume"],
        moreAbout: data["moreAbout"],
      );
    }).toList();
    for (var i = 0; i < response.length; i++) {
      List<String> materials = [];
      for (var j = 0; j < response[i].material.length; j++) {
        materials.add(response[i].material[j].toString());
      }
      buckets.add(MedikasiBaru(
        id: response[i].id,
        name: response[i].name,
        description: response[i].description,
        material: materials,
        make: response[i].make,
        consume: response[i].consume,
        moreAbout: response[i].moreAbout,
      ));
    }
    return buckets
        .where((element) => element.name.toLowerCase().contains(word))
        .toList();
  } catch (e) {
    throw Exception(e);
  }
}

Future<List<MedikasiBaru>> getAllDataMed() async {
  var request =
      await Dio().get("http://pi-toga.herokuapp.com/api/medikasi/get");
  try {
    List<MedikasiBaru> buckets = [];
    var response = request.data.map((data) {
      return MedikasiBaruDynamic(
        id: data["_id"],
        name: data["name"],
        description: data["description"],
        material: data["material"],
        make: data["make"],
        consume: data["consume"],
        moreAbout: data["moreAbout"],
      );
    }).toList();
    for (var i = 0; i < response.length; i++) {
      List<String> materials = [];
      for (var j = 0; j < response[i].material.length; j++) {
        materials.add(response[i].material[j].toString());
      }
      buckets.add(MedikasiBaru(
        id: response[i].id,
        name: response[i].name,
        description: response[i].description,
        material: materials,
        make: response[i].make,
        consume: response[i].consume,
        moreAbout: response[i].moreAbout,
      ));
    }
    return buckets;
  } catch (e) {
    throw Exception(e);
  }
}
