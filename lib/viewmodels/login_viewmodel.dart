import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../services/database_service.dart';

class LoginViewModel {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final DatabaseService _databaseService = DatabaseService();
  final GoogleSignIn _googleSignIn = GoogleSignIn(); // Cliente de Google Sign-In

  // Método para inicio de sesión con correo y contraseña
  Future<bool> login() async {
    final user = await _databaseService.getUser(
      emailController.text,
      passwordController.text,
    );
    return user != null;
  }

  // Método para inicio de sesión con Google
  Future<bool> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        // Puedes registrar al usuario en tu base de datos si es necesario
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('Error al iniciar sesión con Google: $e');
      return false;
    }
  }

  // Liberar los controladores
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
