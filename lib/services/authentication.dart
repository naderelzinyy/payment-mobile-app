import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:payment_app/custom_widgets/globals.dart';

class AuthServices {
  static Future<http.Response> register(String first_name, String last_name,
      String email, String password) async {
    Map data = {
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + '/signup');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + '/signin');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }
}
