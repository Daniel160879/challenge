import 'dart:convert';

import 'package:challenge/domain/estimated_age.dart';
import 'package:http/http.dart' as http;

class NameAgeRepository {
  Future<EstimatedAge> getEstimatedAge(String name) async {
    final url = 'https://api.agify.io?name=$name';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData != null) {
        return EstimatedAge.fromJson(jsonData);
      } else {
        throw Exception('Failed to load estimated age');
      }
    } else {
      throw Exception('Failed to load estimated age');
    }
  }
}
