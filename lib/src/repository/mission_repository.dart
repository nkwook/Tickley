import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:tickley/src/model/mission/mission.dart';
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/utils/utils.dart';

class MissionRepository {
  Utils utils = new Utils();

  Future<List<Mission>> fetchMissionsByCategory(int id) async {
    final response = await http
        .get(Uri.parse(BASE_URL + 'category/' + id.toString() + '/task'));

    if (response.statusCode == 200) {
      return utils.parseMissions(response.body);
    } else {
      throw Exception('Failed to load missions');
    }
  }
}
