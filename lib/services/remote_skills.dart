import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../models/skill_api.dart';

class RemoteSkills {
  Future<List<SkillApi>> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://ffxivcollect.com/api/spells/');
    var response = await client.get(uri);
    try {
      if (response.statusCode == 200) {
        var json = response.body;
        final result = jsonDecode(json)["results"] as List?;
        return result?.map((e) => SkillApi.fromMap(e)).toList() ?? [];
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
