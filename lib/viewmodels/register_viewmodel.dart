import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/database_service.dart';

class RegisterViewModel {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController(); // Añadido para manejar la confirmación de contraseña

  final DatabaseService _databaseService = DatabaseService();

  // Método para registrar un usuario
  Future<void> register() async {
    // Validación adicional, si es necesario
    if (passwordController.text != confirmPasswordController.text) {
      throw Exception('Las contraseñas no coinciden');
    }

    final user = UserModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    await _databaseService.insertUser(user);
  }

  // Liberar los controladores cuando ya no se necesiten
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
