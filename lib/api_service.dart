import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';

class ApiService {
  Future<List<User>> fetchUsers() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
      headers: {"Accept": "application/json", "User-Agent": "FlutterApp"},
    );

    print("Status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Gagal load data: ${response.statusCode}');
    }
  }
}
