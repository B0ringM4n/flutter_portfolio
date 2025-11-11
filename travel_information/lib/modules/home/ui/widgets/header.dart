part of '../home_screen.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final animation = Provider.of<Animation<double>>(context);

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppTheme.paddingLarge,
          left: AppTheme.paddingLarge,
          right: AppTheme.paddingLarge,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'México explora los mundos que viven en un solo país',
              style:
                  Theme.of(
                    context,
                  ).textTheme.headlineSmall!.copyWith(
                    fontSize: 26 - 4 * animation.value,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: AppTheme.spaceSmall),
            const Row(
              children: [
                Icon(
                  Icons.filter_hdr,
                  size: 26,
                  color: Colors.red,
                ),
                SizedBox(width: AppTheme.spaceSmall),
                Text(
                  'Popular',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
