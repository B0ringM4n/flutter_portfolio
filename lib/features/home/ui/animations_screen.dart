import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portafolio/config/theme/app_theme.dart';
import 'package:portafolio/features/travel_info/ui/screen.dart';

class AnimationsScreen extends StatelessWidget {
  const AnimationsScreen({super.key});
  static const routeName = 'animations';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animaciones'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.paddingMedium,
        ),
        child: Column(
          children: [
            const Text(
              'Aquí encontrarás ejemplos de mis proyectos con animaciones.',
            ),
            const Text('¡Explora y disfruta!'),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text('Travel Info'),
              subtitle: const Text(
                'Pequeña pantalla para mostrar información de viajes con animaciones personalizadas y fluidas.',
              ),
              onTap: () {
                unawaited(
                  Navigator.pushNamed(
                    context,
                    TravelInfoScreen.routeName,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
