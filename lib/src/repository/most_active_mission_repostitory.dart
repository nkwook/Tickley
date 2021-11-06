import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:tickley/src/model/most_active_mission/most_active_mission.dart';
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/utils/utils.dart';

class MostActiveMissionRepository {
  Utils utils = new Utils();

  // Future<List<MostActiveMission>> fetchMostActiveMissions() async {
  //   final response =
  //       await http.get(Uri.parse(BASE_URL + 'task/most-completed'));
  //   // print(response.body.toString());
  //   if (response.statusCode == 200) {
  //     return utils.parseMostActiveMissions(response.body);
  //   } else {
  //     throw Exception('Failed to load most active missions');
  //   }
  // }

  Future<MostActiveMission> fetchMostActiveMissions() async {
    final response =
        await http.get(Uri.parse(BASE_URL + 'task/most-completed'));

    // print(response.body.toString());
    if (response.statusCode == 200) {
      return MostActiveMission.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to load most active missions');
    }
  }
}
