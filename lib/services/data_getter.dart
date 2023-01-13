import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class DataGetter {
  getUser() async {
    var data = rootBundle.loadString("json/data.json");
    List<dynamic> content = json.decode(await data);
    return content.map((e) => e).toList();
  }
}
