import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:valorant_app/models/characters_model.dart';
import '../constant/baseurl.dart';

class CharacterService {
  
  Future<List<Character>> getCharacters() async {
    try {
      Uri url = Uri.parse('$baseUrl/agents');
      http.Response response  = await http.get(url);
      
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> data = body["data"];

      List<Character> characters = data.map((dynamic item)=> Character.fromJson(item)).toList();
      // OR
      // for(int i=0; i<data.length; i++) {
      //   characters.add(Character.fromJson(data[i]));
      // }
      
      return characters;
      
    } catch (error) {
      throw "Error that $error";
    }
  }

}