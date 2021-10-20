import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:tickley/src/model/mission/mission.dart';

import 'package:tickley/src/model/tUser/tUser.dart';

import 'dart:math';

final String baseUrl =
    'https://zgojtokt6f.execute-api.ap-northeast-2.amazonaws.com/dev/api/';

Future<List<Mission>> fetchMissionsByCategory(int id) async {
  final response = await http
      .get(Uri.parse(baseUrl + 'category/' + id.toString() + '/task'));

  if (response.statusCode == 200) {
    return parseMissions(response.body);
  } else {
    throw Exception('Failed to load all tasks');
  }
}

List<Mission> parseMissions(String responseBody) {
  final parsed = json.decode(responseBody);
  List<Mission> missionList =
      List<Mission>.from(parsed["data"].map((json) => Mission.fromJson(json)));
  return missionList;
}

List<TUser> parseUser(String responseBody) {
  final parsed = json.decode(responseBody);
  List<TUser> userList =
      List<TUser>.from(parsed["data"].map((json) => TUser.fromJson(json)));
  return userList;
}

Future<List<TUser>> fetchUsersByMission(int id) async {
  // id : task id
  final response =
      await http.get(Uri.parse(baseUrl + 'task/' + id.toString() + '/user'));
  if (response.statusCode == 200) {
    return parseUser(response.body);
  } else {
    throw Exception('Failed to fetch Users');
  }
}

//category 점수
Future<int> fetchCategoryPointSum(int id) async {
  // id : category id
  // final response = await http
  //     .get(Uri.parse(baseUrl + 'category/' + id.toString() + '/pointSum'));

  // if (response.statusCode == 200) {
  //   print("->->"+response.body);
  //   return int.parse(json.decode(response.body)["data"]);
  // } else {
  //   throw Exception('Failed to load all tasks');
  // }
  // 짜증나서 그냥 하드코딩으로 한다...
  var rng = new Random();
  return rng.nextInt(3);
}
