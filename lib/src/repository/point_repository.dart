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

  // need to fixed when category modification
  Future<List<double>> fetchCategoryPoints() async {
    final responses = await Future.wait([
      http.get(Uri.parse(BASE_URL + 'category/1/pointSum')),
      http.get(Uri.parse(BASE_URL + 'category/2/pointSum')),
      http.get(Uri.parse(BASE_URL + 'category/3/pointSum')),
      http.get(Uri.parse(BASE_URL + 'category/4/pointSum')),
    ]);

    // print(responses.toString());
    return [
      getPointsFromResponse(responses[0]),
      getPointsFromResponse(responses[1]),
      getPointsFromResponse(responses[2]),
      getPointsFromResponse(responses[3])
    ];
  }

  double getPointsFromResponse(http.Response response) {
    final result = json.decode(response.body)['data'];
    return double.parse(result);
  }
}
