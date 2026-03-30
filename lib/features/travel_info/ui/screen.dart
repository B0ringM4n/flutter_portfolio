import 'package:flutter/material.dart';
import 'package:portafolio/config/theme/app_theme.dart';
import 'package:portafolio/features/travel_info/ui/controller.dart';
import 'package:provider/provider.dart';

part 'widgets/header.dart';
part 'widgets/item_container.dart';

class TravelInfoScreen extends StatefulWidget {
  const TravelInfoScreen({super.key});

  @override
  State<TravelInfoScreen> createState() => _TravelInfoScreenState();
}

class _TravelInfoScreenState extends State<TravelInfoScreen> {
  final _homeController = TravelInfoController();

  @override
  void dispose() {
    _homeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider.value(
      value: _homeController,
      child: ListenableProvider.value(
        value: _homeController.scrollController,
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification) {
              final imageHeight = MediaQuery.of(context).size.height * 0.4;
              if (imageHeight > _homeController.scrollController.offset) {
                _homeController.updateTotalScroll(
                  notification.scrollDelta!,
                  imageHeight,
                );
              }
            }
            return false;
          },
          child: Scaffold(
            body: SingleChildScrollView(
              controller: _homeController.scrollController,
              physics: const ClampingScrollPhysics(),
              child: const Column(
                children: [
                  _Header(),
                  _ItemContainer(),
                  _ItemContainer(),
                  _ItemContainer(),
                  _ItemContainer(),
                  _ItemContainer(),
                  SizedBox(height: AppTheme.paddingLarge),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
