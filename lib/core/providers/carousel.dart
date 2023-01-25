import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final carouselNotifierProvider =
    StateNotifierProvider.autoDispose<CarouselNotifier, int>(
  (ref) => CarouselNotifier(),
);

class CarouselNotifier extends StateNotifier<int> {
  CarouselNotifier() : super(0);

  final CarouselController carouselController = CarouselController();

  void onItemChange(int index) {
    state = index;
  }
}
