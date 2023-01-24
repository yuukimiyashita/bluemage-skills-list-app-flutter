import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../models/cards_api.dart';

class RemoteCards {
  Future<List<Cards>> getCards() async {
    var client = http.Client();
    var uri = Uri.parse('https://triad.raelys.com/api/cards/');
    var response = await client.get(uri);
    try {
      if (response.statusCode == 200) {
        var json = response.body;
        final result = jsonDecode(json)["results"] as List?;
        return result?.map((e) => Cards.fromMap(e)).toList() ?? [];
      }
      // if (response.statusCode == 200) {
      //   var json = response.body;
      //   final data = FinalApi.fromMap(jsonDecode(json));
      //   //trocar para fromJson caso usando Json
      //   return [data];
      // }
    } catch (e) {
      log(e.toString());
    }

    return [];
  }
}
