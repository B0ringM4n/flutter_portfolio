part of '../screen.dart';

class _ItemContainer extends StatefulWidget {
  const _ItemContainer();

  @override
  State<_ItemContainer> createState() => _ItemContainerState();
}

class _ItemContainerState extends State<_ItemContainer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCirc,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleAnimation() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleAnimation,
      child: Stack(
        children: [
          _ItemSize(animation: _animation),
          _Image(animation: _animation),
          _SquareButton(animation: _animation),
          _Dots(animation: _animation),
          _Lines(animation: _animation),
          _Icons(animation: _animation),
        ],
      ),
    );
  }
}

class _ItemSize extends StatelessWidget {
  const _ItemSize({required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: animation,
      builder: (context, value, child) {
        return Container(
          height: 150 + (1000 * value),
        );
      },
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return ValueListenableBuilder(
      valueListenable: animation,
      builder: (context, value, child) {
        return Positioned(
          top: 30,
          left: AppTheme.paddingLarge + 50 * value,
          right: (AppTheme.paddingLarge * 1.8) * (1 - value),
          child: Container(
            height: 100 + (screenHeight * 0.4) * value,
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.paddingSmall,
            ),
            decoration: const BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                image: NetworkImage(
                  'https://www.gob.mx/cms/uploads/image/file/520949/Hidalgo_Panoramica-de-Mineral-del-chico_web.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Transform.translate(
              offset: Offset(
                0 - 30 * value,
                0,
              ),
              child: Text(
                'Bosques',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 22 + 10 * value,
                  color: value < 0.5 ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SquareButton extends StatelessWidget {
  const _SquareButton({required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: animation,
      builder: (context, value, child) {
        return Positioned(
          top: 80 - 80 * value,
          right: AppTheme.paddingLarge,
          child: Stack(
            children: [
              Transform.translate(
                offset: Offset(
                  -10 * (1 - value),
                  -10 * (1 - value),
                ),
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ),
              Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({required this.animation});

  final Animation<double> animation;

  Widget _buildDot(bool selected) {
    return Container(
      width: 20,
      height: 20,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        shape: BoxShape.circle,
      ),
      child: selected
          ? const CircleAvatar(
              radius: 1,
              backgroundColor: Colors.grey,
            )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: animation,
      builder: (context, value, child) {
        return Positioned(
          top: 180,
          left: 20,
          child: FadeTransition(
            opacity: animation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDot(true),
                SizedBox(height: AppTheme.spaceSmall + 10 * value),
                _buildDot(false),
                SizedBox(height: AppTheme.spaceSmall + 10 * value),
                _buildDot(false),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Lines extends StatelessWidget {
  const _Lines({required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
      top: screenHeight * 0.58,
      left: 74,
      child: FadeTransition(
        opacity: animation,
        child: Container(
          width: 160,
          height: 2,
          color: Colors.black,
        ),
      ),
    );
  }
}

class _Icons extends StatelessWidget {
  const _Icons({required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return ValueListenableBuilder(
      valueListenable: animation,
      builder: (context, value, child) {
        return Positioned(
          top: screenHeight * 0.72,
          left: 74,
          child: Row(
            children: [
              _ScaleIcon(
                icon: Icons.book,
                animation: animation,
                end: 0.5,
              ),
              SizedBox(width: 30 + 10 * value),
              _ScaleIcon(
                icon: Icons.hiking_sharp,
                animation: animation,
                begin: 0.3,
                end: 0.8,
              ),
              SizedBox(width: 30 + 10 * value),
              _ScaleIcon(
                icon: Icons.map_rounded,
                animation: animation,
                begin: 0.5,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ScaleIcon extends StatelessWidget {
  const _ScaleIcon({
    required this.icon,
    required this.animation,
    this.begin = 0.0,
    this.end = 1.0,
  });

  final IconData icon;
  final Animation<double> animation;
  final double begin;
  final double end;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: animation,
          curve: Interval(begin, end),
        ),
      ),
      child: Icon(
        icon,
        size: 30,
      ),
    );
  }
}
