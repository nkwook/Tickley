import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tickley/src/model/category.dart';
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

Future<List<Task>> fetchAllTasks() async {
  final response = await http.get(Uri.parse(baseUrl + 'task'));

  if (response.statusCode == 200) {
    return parseTasks(response.body);
  } else {
    throw Exception('Failed to load all tasks');
  }
}

Future<Task> fetchTaskByID(int id) async {
  final response = await http.get(Uri.parse(baseUrl + 'task/' + id.toString()));

  if (response.statusCode == 200) {
    return Task.fromJson(json.decode(response.body)['data']);
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
