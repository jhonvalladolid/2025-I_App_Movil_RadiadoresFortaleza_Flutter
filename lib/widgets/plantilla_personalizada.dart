import 'package:flutter/material.dart';

class PlantillaPersonalizada extends StatelessWidget {
  final Widget? child;

  const PlantillaPersonalizada({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true, // Permite que el cuerpo se extienda detrás del AppBar
      body: Stack(
        children: [
          // Imagen de fondo
          Image.asset(
            'assets/images/bg.png', // Ruta de la imagen
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: child!, // Contenido principal de la pantalla
          ),
        ],
      ),
    );
  }
}
