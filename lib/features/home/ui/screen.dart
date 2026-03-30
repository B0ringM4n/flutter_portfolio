import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portafolio/config/theme/app_theme.dart';
import 'package:portafolio/features/home/ui/animations_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saludos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.paddingMedium,
        ),
        child: Column(
          children: [
            const Text('Hola, soy un portafolio de Flutter'),
            const Text('¡Bienvenido a mi aplicación!'),
            const Text(
              'Aquí encontrarás ejemplos de mis proyectos y habilidades.',
            ),
            const Text('¡Explora y disfruta!'),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: const Icon(Icons.code),
                title: const Text('Animaciones'),
                subtitle: const Text(
                  'Proyectos con animaciones personalizadas y fluidas.',
                ),
                onTap: () {
                  unawaited(
                    Navigator.pushNamed<void>(
                      context,
                      AnimationsScreen.routeName,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
