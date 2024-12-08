import 'package:flutter/material.dart';
import '../views/welcome_screen.dart';

class SplashViewModel {
  Future<void> handleSplashLogic(BuildContext context) async {
    // Simula el retraso del splash screen
    await Future.delayed(const Duration(seconds: 3));

    // Redirige a la pantalla de bienvenida
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomeScreen(),
      ),
    );
  }
}
