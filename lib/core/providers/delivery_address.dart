import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/models/delivery_address.dart';
import 'package:garifie_client/core/services/user_delivery_address_service.dart';

final userDeliveryAddressProvider =
    StateNotifierProvider<UserDeliveryAddressService, List<DeliveryAddress>>(
  (ref) => UserDeliveryAddressService(),
);

final deliveryAddressListProvider =
    FutureProvider.autoDispose<List<DeliveryAddress>>((ref) {
  return ref.watch(userDeliveryAddressProvider.notifier).getDeliveryAddress();
});

final editDeliveryAddressProvider = StateProvider<bool>((ref) => false);
