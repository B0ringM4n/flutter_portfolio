import 'package:flutter/material.dart'
    show MaterialPageRoute, Route, RouteSettings, Widget;
import 'package:portafolio/features/home/ui/animations_screen.dart';
import 'package:portafolio/features/home/ui/screen.dart';
import 'package:portafolio/features/travel_info/ui/screen.dart';

class AppRouterDelegate {
  static Route<dynamic>? onGenerate(RouteSettings settings) {
    late Widget view;

    switch (settings.name) {
      case HomeScreen.routeName:
        view = const HomeScreen();
      case AnimationsScreen.routeName:
        view = const AnimationsScreen();
      case TravelInfoScreen.routeName:
        view = const TravelInfoScreen();

      default:
        view = const HomeScreen();
    }

    return MaterialPageRoute(
      settings: settings,
      builder: (context) => view,
    );
  }
}
