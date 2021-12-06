import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:tickley/src/model/mission/mission.dart';
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/utils/utils.dart';

class MissionRepository {
  Utils utils = new Utils();

  Future<List<Mission>> fetchMissions(
      bool byPopularity, int page, int size) async {
    final response = await http.get(Uri.parse(BASE_URL +
        'task/?byPopularity=' +
        byPopularity.toString() +
        '&page=' +
        page.toString() +
        '&size=' +
        size.toString()));
    if (response.statusCode == 200) {
      return utils.parseMissions(response.body);
    } else {
      throw Exception('Failed to load missions');
    }
  }

  Future<List<Mission>> fetchMissionsByCategory(int id) async {
    final response = await http
        .get(Uri.parse(BASE_URL + 'category/' + id.toString() + '/task'));

    if (response.statusCode == 200) {
      return utils.parseMissions(response.body);
    } else {
      throw Exception('Failed to load missions');
    }
  }

  Future<bool> postMissionSuggestion(String label, String description) async {
    final response = await http.post(
      Uri.parse(BASE_URL + 'task/tip-off'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'label': label, 'description': description}),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to login');
    }
  }
}
