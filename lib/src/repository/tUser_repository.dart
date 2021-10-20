import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:tickley/src/model/tUser/tUser.dart';
import 'package:tickley/src/utils/constants.dart';

class TUserRepository {
  Future<TUser> userLogin() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) throw Exception('Failed to login');
    String accessToken = user.uid;

    final response = await http.post(
      Uri.parse(BASE_URL + 'user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'accessToken': accessToken,
      }),
    );
    // print(response.body);
    if (response.statusCode == 200) {
      return TUser.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to login');
    }
  }

  // needs to return TUser later.
  Future<int> createUser(
      String nickname, String accessToken, String profileImage) async {
    final response = await http.post(
      Uri.parse(BASE_URL + 'user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nickname': nickname,
        'accessToken': accessToken,
        'profileImage': profileImage
      }),
    );
    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      throw Exception('Failed to create user');
    }
  }
}