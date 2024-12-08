import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  // Método para obtener usuarios del servidor
  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((user) => UserModel.fromMap(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  // Método para sincronizar datos locales con el servidor
  Future<void> syncWithServer(List<UserModel> localUsers) async {
    final url = Uri.parse('$baseUrl/sync');

    final List<Map<String, dynamic>> usersToSync =
        localUsers.map((user) => user.toMap()).toList();
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'users': usersToSync}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to sync with server');
    }
  }
}
