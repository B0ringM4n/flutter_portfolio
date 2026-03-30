import 'package:flutter/material.dart';
import 'package:portafolio/config/router/delegate.dart';
import 'package:portafolio/features/home/ui/screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Portafolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),
      onGenerateRoute: AppRouterDelegate.onGenerate,
      home: const HomeScreen(),
    );
  }
}
