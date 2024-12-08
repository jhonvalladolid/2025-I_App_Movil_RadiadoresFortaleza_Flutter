import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../services/database_service.dart';
import '../models/user_model.dart';
import '../views/login_screen.dart';

class HomeViewModel {
  final ApiService _apiService = ApiService(baseUrl: 'https://api.example.com');
  final DatabaseService _databaseService = DatabaseService();

  // Método para sincronizar datos con el servidor
  Future<bool> syncData() async {
    try {
      // Obtén usuarios locales desde la base de datos
      final List<UserModel> localUsers = await _databaseService.getAllUsers();

      // Sincroniza con el servidor
      await _apiService.syncWithServer(localUsers);
      return true;
    } catch (e) {
      // Manejo de errores de sincronización
      debugPrint('Error al sincronizar: $e');
      return false;
    }
  }

  // Método para cerrar sesión
  void logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }
}
