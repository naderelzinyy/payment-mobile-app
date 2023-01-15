import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/data_model.dart';

class DataGetter {
  var baseUrl = "http://localhost:8000/api";

  getUser() async {
    var apiUrl = "/billinfo";
    http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));

    try {
      if (response.statusCode == 200) {
        List<dynamic> apiData = await json.decode(response.body);
        print(apiData);
        return apiData.map((e) => DataModel.fromJson(e)).toList();
      } else {
        print("Connection with api failed!");
      }
    } catch (exp) {
      print(exp);
    }
  }
}
