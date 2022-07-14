// ignore_for_file: body_might_complete_normally_nullable

import 'package:http/http.dart' as http;
import 'package:toga_app/models/medikasi.dart';
import 'package:toga_app/models/tanaman.dart';

class HomeController {
  var baseUrl = 'https://pi-toga.herokuapp.com/api';
  var client = http.Client();

  Future<List<Tanaman>?> getTanamans() async {
    try {
      var uri = Uri.parse('$baseUrl/tanaman/get');
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        var json = response.body;
        return tanamanFromJson(json);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Medikasi>?> getMedikasis() async {
    try {
      var uri = Uri.parse('$baseUrl/medikasi/get');
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        var json = response.body;
        return medikasiFromJson(json);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
