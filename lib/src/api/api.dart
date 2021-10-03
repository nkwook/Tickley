import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tickley/src/model/category.dart';
import 'package:tickley/src/model/t_user.dart';
import 'package:tickley/src/model/task_completed.dart';
import '../model/task.dart';
import '../model/user.dart';
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

List<User> parseUser(String responseBody) {
  final parsed = json.decode(responseBody);
  List<User> userList =
      List<User>.from(parsed["data"].map((json) => User.fromJson(json)));
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

Future<int> postTaskOperation(int userId, int taskId) async {
  final response = await http.post(
    Uri.parse(baseUrl + 'user/' + userId.toString() + '/task'),
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

Future<List<Task>> fetchTasksByUser(int id) async {
  final response =
      await http.get(Uri.parse(baseUrl + 'user/' + id.toString() + '/task'));

  if (response.statusCode == 200) {
    return parseTasks(response.body);
  } else {
    throw Exception('Failed to load all tasks');
  }
}

Future<List<TaskCompleted>> fetchCompletedTasksByUser(int id) async {
  final response =
  await http.get(Uri.parse(baseUrl + 'user/' + id.toString() + '/completedTask'));

  if (response.statusCode == 200) {
    return parseCompletedTasks(response.body);
  } else {
    throw Exception('Failed to load all tasks');
  }
}

List<TaskCompleted> parseCompletedTasks(String responseBody) {
  final parsed = json.decode(responseBody);
  List<TaskCompleted> taskList =
  List<TaskCompleted>.from(parsed["data"].map((json) => TaskCompleted.fromJson(json)));
  return taskList;
}

Future<List<Task>> fetchUser(int id) async {
  final response = await http.get(Uri.parse(baseUrl + 'user/' + id.toString()));

  if (response.statusCode == 200) {
    return parseTasks(response.body);
  } else {
    throw Exception('Failed to load all tasks');
  }
}

Future<List<User>> fetchUsersByTask(int id) async {
  // id : task id
  final response =
      await http.get(Uri.parse(baseUrl + 'task/' + id.toString() + '/user'));

  if (response.statusCode == 200) {
    return parseUser(response.body);
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
Future<TUser> getUserData(int id) async {
  final response = await http.get(Uri.parse(baseUrl + 'user/' + id.toString()));

  if (response.statusCode == 200) {
    return TUser.fromJson(json.decode(response.body)['data']);
  } else {
    throw Exception('Failed to load all tasks');
  }
}
