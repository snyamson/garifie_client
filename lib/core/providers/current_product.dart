import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/models/product.dart';

final currentProductNotifier = StateProvider<Product>(
  (ref) => Product(
    name: '',
    description: '',
    quantity: 0,
    ingredients: '',
    healthBenefit: '',
    productImg: '',
    variant: [],
  ),
);

final currentProductImgProvider = StateProvider<String>((ref) {
  if (ref.watch(currentProductNotifier).variant.isNotEmpty) {
    return ref.watch(currentProductNotifier).variant.first.img!;
  }
  return ref.watch(currentProductNotifier).productImg;
});

final currentProductVariantProvider = StateProvider<Variant?>(
  (ref) {
    if (ref.watch(currentProductNotifier).variant.isNotEmpty) {
      return ref.watch(currentProductNotifier).variant.first;
    }
    return null;
  },
);
