import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/models/product.dart';
import 'package:garifie_client/core/services/product_service.dart';

final productProvider = Provider((ref) => ProductService());

final productListProvider = FutureProvider.autoDispose<List<Product>>((ref) {
  return ref.read(productProvider).getProducts();
});

final productDetailProvider =
    FutureProvider.autoDispose.family<Product, String>((ref, id) {
  return ref.read(productProvider).getProductById(id);
});
