import 'package:flutter/material.dart';
import '../viewmodels/splash_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final SplashViewModel _viewModel = SplashViewModel();

  @override
  void initState() {
    super.initState();

    // Configuración de la animación
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();

    // Manejar lógica de Splash
    _viewModel.handleSplashLogic(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: 0.5 + (_controller.value * 0.5),
                  child: child,
                );
              },
              child: Image.asset(
                'assets/images/logo.webp',
                width: 250,
                height: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
