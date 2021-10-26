import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tickley/src/model/completed_mission/completed_mission.dart';
import 'package:tickley/src/utils/constants.dart';

class CompletedMissionRepository {
  Future<List<CompletedMission>> fetchCompletedMissionsByUser(int id) async {
    final response = await http
        .get(Uri.parse(BASE_URL + 'user/' + id.toString() + '/completedTask'));

    if (response.statusCode == 200) {
      return parseCompletedMissions(response.body);
    } else {
      throw Exception('Failed to load completed missions');
    }
  }

  Future<List<List<CompletedMission>>> fetchWeeklyCompletedMissionsByUser(
      int id) async {
    final response = await http.get(Uri.parse(
        BASE_URL + 'user/' + id.toString() + '/completedTask/weekly'));

    print(response.body.toString());
    if (response.statusCode == 200) {
      return parseWeeklyCompletedMissions(response.body);
    } else {
      throw Exception('Failed to load weekly completed missions');
    }
  }

  List<CompletedMission> parseCompletedMissions(String responseBody) {
    final parsed = json.decode(responseBody);

    List<CompletedMission> missionList = List<CompletedMission>.from(
        parsed["data"].map((json) => CompletedMission.fromJson(json)));
    return missionList;
  }

  List<List<CompletedMission>> parseWeeklyCompletedMissions(
      String responseBody) {
    final parsed = json.decode(responseBody);
    // List<List<CompletedMission>> m = List<List<CompletedMission>>.from(
    //     parsed["data"].map((jsonArr) => CompletedMission.fromJson(jsonArr)));
    //     .toList()
    //     .map((json) => CompletedMission.fromJson()
    //     )
    // }));
    List<List<CompletedMission>> missionList = [];

    parsed["data"].foreach((jsonArr) => {
          print(jsonArr)
          // jsonArr.toList().foreach((json) => json)
        });

    // print(missionList.toString());
    return missionList;
  }
}
