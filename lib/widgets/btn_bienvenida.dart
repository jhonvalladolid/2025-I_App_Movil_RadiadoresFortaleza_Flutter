import 'package:flutter/material.dart';

class BotonBienvenida extends StatelessWidget {
  final String textoBoton;
  final Widget destino;
  final Color color;
  final Color colorTexto;

  const BotonBienvenida({
    super.key,
    required this.textoBoton,
    required this.destino,
    required this.color,
    required this.colorTexto,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destino),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
        ),
        child: Text(
          textoBoton,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: colorTexto,
          ),
        ),
      ),
    );
  }
}
