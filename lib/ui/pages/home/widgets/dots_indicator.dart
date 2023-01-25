import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/providers/carousel.dart';
import 'package:garifie_client/utils/theme/app_colors.dart';

class DotsIndicator extends ConsumerWidget {
  final List<String> images;

  const DotsIndicator({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCarouselIndex = ref.watch(carouselNotifierProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: images.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => ref
              .read(carouselNotifierProvider.notifier)
              .carouselController
              .animateToPage(entry.key),
          child: Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (Theme.of(context).brightness == Brightness.dark
                      ? appColorPrimaryLight
                      : appSecondaryBackgroundColor)
                  .withOpacity(
                currentCarouselIndex == entry.key ? 0.9 : 0.3,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
