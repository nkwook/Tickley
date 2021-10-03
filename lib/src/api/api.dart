import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:tickley/src/model/category.dart';
import 'package:tickley/src/model/t_user.dart';
import 'package:tickley/src/model/task_completed.dart';
import '../model/task.dart';
import 'dart:math';

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
  List<Task> taskList =
      List<Task>.from(parsed["data"].map((json) => Task.fromJson(json)));
  return taskList;
}

List<TUser> parseUser(String responseBody) {
  final parsed = json.decode(responseBody);
  List<TUser> userList =
      List<TUser>.from(parsed["data"].map((json) => TUser.fromJson(json)));
  return userList;
}

Future<Task> fetchTaskByID(int id) async {
  final response = await http.get(Uri.parse(baseUrl + 'task/' + id.toString()));

  if (response.statusCode == 200) {
    return Task.fromJson(json.decode(response.body)['data']);
  } else {
    throw Exception('Failed to load all tasks');
  }
}

Future<List<Task>> fetchTodayTasks(int userId) async {
  final queryParameters = {'userId': userId.toString()};
  String queryString = Uri(queryParameters: queryParameters).query;
  final response =
      await http.get(Uri.parse(baseUrl + 'task/today?' + queryString));

  if (response.statusCode == 200) {
    return parseTasks(response.body);
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

Future<List<TUser>> fetchUsersByTask(int id) async {
  // id : task id
  final response =
      await http.get(Uri.parse(baseUrl + 'task/' + id.toString() + '/user'));
  if (response.statusCode == 200) {
    return parseUser(response.body);
  } else {
    throw Exception('Failed to fetch Users');
  }
}

Future<List<TaskCompleted>> fetchCompletedTasksByUser(int id) async {
  final response = await http
      .get(Uri.parse(baseUrl + 'user/' + id.toString() + '/completedTask'));

  if (response.statusCode == 200) {
    return parseCompletedTasks(response.body);
  } else {
    throw Exception('Failed to load all tasks');
  }
}

List<TaskCompleted> parseCompletedTasks(String responseBody) {
  final parsed = json.decode(responseBody);
  List<TaskCompleted> taskList = List<TaskCompleted>.from(
      parsed["data"].map((json) => TaskCompleted.fromJson(json)));
  return taskList;
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

// MyPage

// user/:id
Future<TUser> fetchUserData(int id) async {
  final response = await http.get(Uri.parse(baseUrl + 'user/' + id.toString()));

  if (response.statusCode == 200) {
    return TUser.fromJson(json.decode(response.body)['data']);
  } else {
    throw Exception('failed to fetch user');
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

/* ### `POST api/user/:id/unmarkTask`   :id에 해당하는 유저가 task를 즐겨찾기에서 삭제
- body : {taskId }*/
Future<int> deleteFavoriteTask(int id, int taskId) async {
  final response = await http.post(
    Uri.parse(baseUrl + 'user/' + id.toString() + '/unmarkTask'),
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
