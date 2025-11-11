part of '../home_screen.dart';

class _ItemContainer extends StatelessWidget {
  const _ItemContainer();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        _ItemSize(),
        _Image(),
        _SquareButton(),
        _Dots(),
        _Lines(),
        _Icons(),
      ],
    );
  }
}

class _ItemSize extends StatelessWidget {
  const _ItemSize();

  @override
  Widget build(BuildContext context) {
    final animation = Provider.of<Animation<double>>(context);

    return Container(
      height: 150 + (1000 * animation.value),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    final animation = Provider.of<Animation<double>>(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
      top: 30,
      left: AppTheme.paddingLarge + 50 * animation.value,
      right: (AppTheme.paddingLarge * 1.8) * (1 - animation.value),
      child: Container(
        height: 100 + (screenHeight * 0.4) * animation.value,
        alignment: Alignment.bottomLeft,

        padding: const EdgeInsets.symmetric(horizontal: AppTheme.paddingSmall),
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
            0 - 30 * animation.value,
            0,
          ),
          child: Text(
            'Bosques',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 22 + 10 * animation.value,
              color: animation.value < 0.5 ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _SquareButton extends StatelessWidget {
  const _SquareButton();

  @override
  Widget build(BuildContext context) {
    final animation = Provider.of<Animation<double>>(context);

    return Positioned(
      top: 80 - 80 * animation.value,
      right: AppTheme.paddingLarge,
      child: Stack(
        children: [
          Transform.translate(
            offset: Offset(
              -10 * (1 - animation.value),
              -10 * (1 - animation.value),
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
  }
}

class _Dots extends StatelessWidget {
  const _Dots();

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
    final animation = Provider.of<Animation<double>>(context);
    return Positioned(
      top: 180,
      left: 20,
      child: FadeTransition(
        opacity: animation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDot(true),
            SizedBox(height: AppTheme.spaceSmall + 10 * animation.value),
            _buildDot(false),
            SizedBox(height: AppTheme.spaceSmall + 10 * animation.value),
            _buildDot(false),
          ],
        ),
      ),
    );
  }
}

class _Lines extends StatelessWidget {
  const _Lines();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
      top: screenHeight * 0.58,
      left: 74,
      child: FadeTransition(
        opacity: Provider.of<Animation<double>>(context),
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
  const _Icons();

  @override
  Widget build(BuildContext context) {
    final animation = Provider.of<Animation<double>>(context);
    final screenHeight = MediaQuery.of(context).size.height;

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
          SizedBox(width: 30 + 10 * animation.value),
          _ScaleIcon(
            icon: Icons.hiking_sharp,
            animation: animation,
            begin: 0.3,
            end: 0.8,
          ),
          SizedBox(width: 30 + 10 * animation.value),
          _ScaleIcon(
            icon: Icons.map_rounded,
            animation: animation,
            begin: 0.5,
          ),
        ],
      ),
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
