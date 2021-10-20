import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:tickley/src/model/mission/mission.dart';
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/utils/utils.dart';

class FavoriteMissionRepository {
  Utils utils = new Utils();
  Future<List<Mission>> fetchFavoriteMissionsByUser(int id) async {
    final response =
        await http.get(Uri.parse(BASE_URL + 'user/' + id.toString() + '/task'));

    if (response.statusCode == 200) {
      return utils.parseMissions(response.body);
    } else {
      throw Exception('Failed to load favorite missions');
    }
  }

  Future<int> addFavoriteMission(int id, int taskId) async {
    final response = await http.post(
      Uri.parse(BASE_URL + 'user/' + id.toString() + '/markTask'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{'taskId': taskId}),
    );
    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      throw Exception('Failed to load all tasks');
    }
  }

/* ### `POST api/user/:id/unmarkTask`   :id에 해당하는 유저가 task를 즐겨찾기에서 삭제
- body : {taskId }*/
  Future<int> deleteFavoriteMission(int id, int taskId) async {
    final response = await http.post(
      Uri.parse(BASE_URL + 'user/' + id.toString() + '/unmarkTask'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{'taskId': taskId}),
    );
    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      throw Exception('Failed to load all tasks');
    }
  }

  Future<int> postMissionCompleted(int userId, int taskId) async {
    final response = await http.post(
      Uri.parse(BASE_URL + 'user/' + userId.toString() + '/completeTask'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{
        'taskId': taskId,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body)["status"];
    } else {
      throw Exception('Failed to load all tasks');
    }
  }
}
