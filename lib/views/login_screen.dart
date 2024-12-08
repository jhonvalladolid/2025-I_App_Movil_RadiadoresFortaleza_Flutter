import 'package:flutter/material.dart';
import '../widgets/plantilla_personalizada.dart';
import '../core/themes.dart';
import '../viewmodels/login_viewmodel.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final LoginViewModel _viewModel = LoginViewModel();
  bool rememberPassword = true;

  @override
  Widget build(BuildContext context) {
    return PlantillaPersonalizada(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(height: 10), // Espacio superior
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo
                      Image.asset(
                        'assets/images/logo.webp',
                        width: 250,
                        height: 60,
                      ),
                      const SizedBox(height: 50),
                      // Correo electrónico
                      TextFormField(
                        controller: _viewModel.emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa tu correo electrónico';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Correo electrónico:',
                          hintText: 'ejemplo@correo.com',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Contraseña
                      TextFormField(
                        controller: _viewModel.passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa tu contraseña';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Contraseña:',
                          hintText: 'Introduzca la contraseña',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberPassword,
                                onChanged: (bool? value) {
                                  setState(() {
                                    rememberPassword = value!;
                                  });
                                },
                                activeColor: lightColorScheme.primary,
                              ),
                              const Text(
                                'Recuérdame',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: Text(
                              '¿Olvidó la contraseña?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),

                      // Botón de iniciar sesión
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final success = await _viewModel.login();
                              if (success) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeScreen()),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Credenciales incorrectas')),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: lightColorScheme.primary,
                          ),
                          child: const Text(
                            'Iniciar sesión',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Botón de Google
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () async {
                            final success = await _viewModel.loginWithGoogle();
                            if (success) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Inicio de sesión con Google fallido')),
                              );
                            }
                          },
                          icon: Image.asset(
                            'assets/icons/google_icon.png', // Icono de Google
                            width: 20,
                          ),
                          label: const Text(
                            'Iniciar sesión con Google',
                            style: TextStyle(
                                // color: Colors.black87,
                                fontSize: 16),
                          ),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            side: BorderSide(color: Colors.grey.shade400),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Navegación hacia el registro
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '¿No tienes cuenta? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen()),
                              );
                            },
                            child: Text(
                              'Regístrate',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
