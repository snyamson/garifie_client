import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/models/cart.dart';

final cartProvider = StateNotifierProvider<CartNotifier, Map<String, Cart>>(
  (ref) => CartNotifier(),
);

class CartNotifier extends StateNotifier<Map<String, Cart>> {
  CartNotifier() : super(<String, Cart>{});

  _cartSubTotal() {
    return state.entries
        .map(
          (cartItem) => cartItem.value.amount * cartItem.value.quantity,
        )
        .toList();
  }

  int cartTotal() {
    return _cartSubTotal().fold(
      0,
      (previousCartItem, nextCartItem) => previousCartItem! + nextCartItem!,
    );
  }

  void addToCart({required Cart cartItem}) {
    if (state.containsKey(cartItem.id)) {
      print('Item Already in Cart');
    } else {
      state.putIfAbsent(
        cartItem.id,
        () => cartItem,
      );
      print('added to Cart');
      print(state);
      print(cartTotal());
    }
  }
}
