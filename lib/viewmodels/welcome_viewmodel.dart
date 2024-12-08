import 'package:flutter/material.dart';
import '../views/login_screen.dart';
import '../views/register_screen.dart';

class WelcomeViewModel {
  // Navegar a la pantalla de inicio de sesión
  Widget navigateToLogin(BuildContext context) {
    return const LoginScreen();
  }

  // Navegar a la pantalla de registro
  Widget navigateToRegister(BuildContext context) {
    return const RegisterScreen();
  }
}
