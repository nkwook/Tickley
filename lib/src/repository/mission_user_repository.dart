import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:tickley/src/model/mission_user/mission_user.dart';
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/utils/utils.dart';

class MissionUserRepository {
  Utils utils = new Utils();

  Future<List<MissionUser>> fetchLastestUserbyMission(int id) async {
    final response = await http.get(
        Uri.parse(BASE_URL + 'task/' + id.toString() + '/user?byLatest=true'));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return utils.parseMissionUsers(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }
}
