import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_information/modules/home/ui/home_controlle.dart';
import 'package:travel_information/theme/app_theme.dart';

part 'widgets/item_container.dart';
part 'widgets/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final _homeController = HomeController();

  @override
  void initState() {
    super.initState();
    _homeController.init(this);
  }

  @override
  void dispose() {
    _homeController.dispose();
    super.dispose();
  }

  Future<void> toggleAnimation() async {
    if (_homeController.animationController.isCompleted) {
      _homeController.animationController.reverse();
    } else {
      _homeController.animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider.value(
      value: _homeController.animation,
      child: ListenableProvider.value(
        value: _homeController.scrollController,
        child: ListenableProvider.value(
          value: _homeController.scrollInformation,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification) {
                final imageHeight = MediaQuery.of(context).size.height * 0.4;
                if (imageHeight > _homeController.scrollController.offset) {
                  // setState(() {
                  //   _homeController.scrollInformation.updateScroll(
                  //     notification.scrollDelta!,
                  //     imageHeight
                  //   );
                  // });
                }
              }
              return false;
            },
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: toggleAnimation,
                child: const Icon(Icons.play_arrow),
              ),
              body: SingleChildScrollView(
                controller: _homeController.scrollController,
                physics: const ClampingScrollPhysics(),
                child: const Column(
                  children: [
                    _Header(),
                    _ItemContainer(),
                    _ItemContainer(),
                  ],
                ),
              ),
              // const Stack(
              //   children: [
              //     _Header(),
              //     _ItemContainers(),
              //     _SquareButton(),
              //     _Dots(),
              //     _Lines(),
              //     _Icons(),
              //   ],
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
