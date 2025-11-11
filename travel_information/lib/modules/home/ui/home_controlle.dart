import 'package:flutter/material.dart';

class ScrollInformationNotifier extends ChangeNotifier {}

class HomeController extends ChangeNotifier {
  HomeController();

  late AnimationController animationController;
  late Animation<double> animation;
  late ScrollController scrollController;
  final scrollInformation = ScrollInformationNotifier();

  void init(TickerProvider vsync) {
    scrollController = ScrollController();
    animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 1000),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOutCirc,
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
