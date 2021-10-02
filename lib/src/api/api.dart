import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tickley/src/model/category.dart';
import 'package:tickley/src/model/tUser.dart';
import '../model/task.dart';

final String baseUrl =
    'https://zgojtokt6f.execute-api.ap-northeast-2.amazonaws.com/dev/api/';

Future<List<Category>> fetchCategories() async {
  final response = await http.get(Uri.parse(baseUrl + 'category'));
  if (response.statusCode == 200) {
    return parseCategories(response.body);
  } else {
    throw Exception('Failed to load all categories');
  }
}

List<Category> parseCategories(String responseBody) {
  final parsed = json.decode(responseBody);
  return List<Category>.from(
      parsed["data"].map((json) => Category.fromJson(json)));
}

Future<List<Task>> fetchTasksByCategory(int id) async {
  final response = await http
      .get(Uri.parse(baseUrl + 'category/' + id.toString() + '/task'));

  if (response.statusCode == 200) {
    return parseTasks(response.body);
  } else {
    throw Exception('Failed to load all tasks');
  }
}

Future<List<Task>> fetchAllTasks() async {
  final response = await http.get(Uri.parse(baseUrl + 'task'));

  if (response.statusCode == 200) {
    return parseTasks(response.body);
  } else {
    throw Exception('Failed to load all tasks');
  }
}

List<Task> parseTasks(String responseBody) {
  final parsed = json.decode(responseBody);
  List<Task> l =
      List<Task>.from(parsed["data"].map((json) => Task.fromJson(json)));

  return l;
}

Future<Task> fetchTaskByID(int id) async {
  final response = await http.get(Uri.parse(baseUrl + 'task/' + id.toString()));

  if (response.statusCode == 200) {
    return Task.fromJson(json.decode(response.body)['data']);
  } else {
    throw Exception('Failed to load all tasks');
  }
}

Future<int> postTaskOperation(int userId, int taskId) async {
  final response = await http.post(
    Uri.parse(baseUrl + 'user/' + userId.toString() + '/completeTask'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, int>{
      'taskId': taskId,
    }),
  );
  print(response.body);
  if (response.statusCode == 200) {
    return json.decode(response.body)["status"];
  } else {
    throw Exception('Failed to load all tasks');
  }
}

Future<List<Task>> fetchFavoriteTasksByUser(int id) async {
  final response =
      await http.get(Uri.parse(baseUrl + 'user/' + id.toString() + '/task'));

  if (response.statusCode == 200) {
    return parseTasks(response.body);
  } else {
    throw Exception('Failed to load all tasks');
  }
}

/* POST api/user/login   : (로그인용)accessToken에 해당하는 유저 조회,
 없을 경우 상태코드 403을 리턴, 있을 경우 유저 객체 전체를 넘겨줌 */
Future<TUser> userLogin(String accessToken) async {
  final response = await http.post(
    Uri.parse(baseUrl + 'user/login'),
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

/* POST api/user : 유저 만들기 */
Future<int> createUser(
    String nickname, String accessToken, String profileImage) async {
  final response = await http.post(
    Uri.parse(baseUrl + 'user'),
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
    throw Exception('Failed to load all tasks');
  }
}

/* ### `POST api/user/:id/markTask` :id에 해당하는 유저가 
task를 즐겨찾기에 추가 - body : {taskId } */
Future<int> postFavoriteTask(int id, int taskId) async {
  final response = await http.post(
    Uri.parse(baseUrl + 'user/' + id.toString() + '/markTask'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, int>{'taskId': taskId}),
  );
  print(response.body);
  if (response.statusCode == 200) {
    return response.statusCode;
  } else {
    throw Exception('Failed to load all tasks');
  }
}
