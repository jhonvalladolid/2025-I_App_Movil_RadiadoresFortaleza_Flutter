import 'package:flutter/material.dart';
import 'core/themes.dart';
import 'views/splash_screen.dart'; // Importa la pantalla SplashScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radiadores Fortaleza',
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: ThemeMode.light, // Cambiar a ThemeMode.dark si prefieres el tema oscuro
      home: const SplashScreen(), // Establece el SplashScreen como pantalla inicial
    );
  }
}
