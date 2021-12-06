import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tickley/src/model/category/category.dart';
import 'package:tickley/src/utils/constants.dart';

class CategoryRepository {
  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse(BASE_URL + 'category'));
    if (response.statusCode == 200) {
      return parseCategories(response.body);
    } else {
      throw Exception('Failed to load all categories');
    }
  }
}

List<Category> parseCategories(String responseBody) {
  final parsed = json.decode(responseBody);
  return List<Category>.from(
      parsed["data"].map((json) => Category.fromJson(json)));
}
