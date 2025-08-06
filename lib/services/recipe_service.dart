import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.40.13:8001/api';

  /// Fetch recipes for a specific page (pagination)
  static Future<Map<String, dynamic>> fetchRecipes({int page = 1}) async {
    final response = await http.get(Uri.parse('$baseUrl/recipes/?page=$page'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      // Extract the list of recipes from "results"
      final List recipesJson = data['results'] ?? [];

      // Convert to Recipe objects
      final recipes = recipesJson.map((json) => Recipe.fromJson(json)).toList();

      return {
        'recipes': recipes,
        'next': data['next'], // Next page URL (if any)
        'previous': data['previous'], // Previous page URL (if any)
        'count': data['count'], // Total count of recipes
      };
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
