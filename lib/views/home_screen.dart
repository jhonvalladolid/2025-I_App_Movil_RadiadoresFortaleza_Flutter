import 'package:flutter/material.dart';
import '../viewmodels/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = HomeViewModel();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla Principal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              viewModel.logout(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bienvenido a la aplicación',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final isSynced = await viewModel.syncData();
                final message = isSynced
                    ? 'Sincronización exitosa con el servidor'
                    : 'Error en la sincronización';
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              },
              child: const Text('Sincronizar con el servidor'),
            ),
          ],
        ),
      ),
    );
  }
}
