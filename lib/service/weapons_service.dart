import 'package:flutter/material.dart';

import '../models/weapons_model.dart';
import 'package:http/http.dart' as http;
import '../constant/baseurl.dart';
import 'dart:convert';

class WeaponsServices {
  Future<List<Weapon>> getAllWeapons() async {
    try {
      Uri url = Uri.parse('$baseUrl/weapons');
      http.Response response = await http.get(url);

      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> data = body['data'];
      List<Weapon> weapons =
          data.map((dynamic item) => Weapon.fromJSON(item)).toList();
      return weapons;
    } catch (error) {
      debugPrint("the error is $error");
      throw "Error that $error";
    }
  }
}
