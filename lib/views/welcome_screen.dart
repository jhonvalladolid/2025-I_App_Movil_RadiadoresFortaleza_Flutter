import 'package:flutter/material.dart';
import '../viewmodels/welcome_viewmodel.dart';
import '../widgets/btn_bienvenida.dart';
import '../widgets/plantilla_personalizada.dart';
import '../core/themes.dart'; // Asegúrate de tener los colores definidos en un tema global

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WelcomeViewModel viewModel = WelcomeViewModel();

    return PlantillaPersonalizada(
      child: Column(
        children: [
          // Texto de bienvenida
          Flexible(
            flex: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '¡Bienvenido de nuevo!\n',
                        style: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white, // Ajustado para fondo con imagen
                        ),
                      ),
                      TextSpan(
                        text:
                            '\nEn Radiadores Fortaleza, trabajamos con esfuerzo y dedicación para ofrecerte lo mejor.',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white70, // Ajustado para fondo con imagen
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Botones de acción
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  // Botón para iniciar sesión
                  Expanded(
                    child: BotonBienvenida(
                      textoBoton: 'Iniciar sesión',
                      destino: viewModel.navigateToLogin(context),
                      color: Colors.transparent,
                      colorTexto: Colors.white,
                    ),
                  ),
                  // Botón para registrarse
                  Expanded(
                    child: BotonBienvenida(
                      textoBoton: 'Registrarse',
                      destino: viewModel.navigateToRegister(context),
                      color: Colors.white,
                      colorTexto: lightColorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
