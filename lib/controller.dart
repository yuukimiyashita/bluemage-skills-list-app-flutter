import 'package:apifinalfantasy/services/remote_skills.dart';

import 'models/skill_api.dart';

class ApiController {
  List<SkillApi> dados = [];
  final repository = RemoteSkills();

  Future start() async {
    dados = await repository.getPosts();
  }
}
