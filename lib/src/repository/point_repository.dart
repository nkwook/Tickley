import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:tickley/src/utils/constants.dart';

class PointRepository {
  Future<int> fetchAllUserPoint() async {
    final response = await http.get(Uri.parse(BASE_URL + 'point/user/sum'));
    if (response.statusCode == 200) {
      return int.parse(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to load points');
    }
  }

  Future<int> fetchUserLength() async {
    final response = await http.get(Uri.parse(BASE_URL + 'user'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'].length;
    } else {
      throw Exception('Failed to load userlength');
    }
  }
}
