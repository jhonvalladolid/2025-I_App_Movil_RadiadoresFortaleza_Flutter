import 'package:flutter/material.dart';
import '../widgets/plantilla_personalizada.dart';
import '../core/themes.dart';
import '../viewmodels/register_viewmodel.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final RegisterViewModel _viewModel = RegisterViewModel();

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
                      // Nombre completo
                      TextFormField(
                        controller: _viewModel.nameController,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa tu nombre completo';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Nombre completo:',
                          hintText: 'Ejemplo: Juan Pérez',
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
                          hintText: '********',
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
                      // Confirmar contraseña
                      TextFormField(
                        controller: _viewModel.confirmPasswordController,
                        obscureText: true,
                        validator: (value) {
                          if (value != _viewModel.passwordController.text) {
                            return 'Las contraseñas no coinciden';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Confirmar contraseña:',
                          hintText: '********',
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
                      const SizedBox(height: 25),
                      // Botón de registro
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await _viewModel.register();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Usuario registrado con éxito')),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                              );
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
                            'Registrarse',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Navegación hacia el inicio de sesión
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '¿Ya tienes una cuenta? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                              );
                            },
                            child: Text(
                              'Inicia sesión',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
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
