import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.40.13:8001/api';

  static Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(Uri.parse('$baseUrl/recipes/'));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      print(data); // Debugging line to check the response data
      return data.map((json) => Recipe.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
