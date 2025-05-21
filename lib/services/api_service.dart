import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book.dart';

class ApiService {
  static Future<List<Book>> searchBooks(String query) async {
    final response = await http.get(
      Uri.parse('https://www.googleapis.com/books/v1/volumes?q=$query'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['items'] as List).map((item) => Book.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }
}
