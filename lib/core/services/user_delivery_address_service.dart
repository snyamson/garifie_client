import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/models/delivery_address.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserDeliveryAddressService extends StateNotifier<List<DeliveryAddress>> {
  UserDeliveryAddressService() : super(<DeliveryAddress>[]);
  SupabaseClient client = Supabase.instance.client;

  Future<List<DeliveryAddress>> getDeliveryAddress() async {
    try {
      final response =
          await client.from('delivery_address').select() as List<dynamic>;
      if (response.isNotEmpty) {
        return state = [
          ...response.map((e) => DeliveryAddress.fromMap(e)).toList()
        ];
      }
    } on PostgrestException catch (e) {
      debugPrint(e.message); // todo: handle exception

    } catch (e) {
      debugPrint(e.toString()); // todo: handle exception

    }
    return state;
  }

  Future<void> addDeliveryAddress({
    required DeliveryAddress address,
    required bool isUpdate,
    required VoidCallback onSuccess,
    required Function(String msg) onError,
  }) async {
    try {
      final currentUser = client.auth.currentUser;

      address = address.copyWith(userId: currentUser?.id);

      final insertedAddress = await client
          .from('delivery_address')
          .upsert(
            isUpdate
                ? {
                    "id": address.id,
                    "contact_name": address.contactName,
                    "mobile_number": address.mobileNumber,
                    "street": address.streetName,
                    "region": address.region,
                    "city": address.city,
                    "is_default": address.isDefault,
                    "user_id": address.userId,
                  }
                : {
                    "contact_name": address.contactName,
                    "mobile_number": address.mobileNumber,
                    "street": address.streetName,
                    "region": address.region,
                    "city": address.city,
                    "is_default": address.isDefault,
                    "user_id": address.userId,
                  },
          )
          .select<PostgrestMap>()
          .single();
      if (address.isDefault) {
        await setDefaultAddress(
            id: insertedAddress['id'],
            onSuccess: () async {
              await getDeliveryAddress();
            });
      } else {
        await getDeliveryAddress();
      }
      onSuccess();
    } on PostgrestException catch (e) {
      onError(e.message);
    } catch (e) {
      onError(e.toString());
    }
  }

  Future<void> setDefaultAddress(
      {required String id, required VoidCallback onSuccess}) async {
    try {
      await client.from('delivery_address').update({"is_default": true}).match(
        {"id": id},
      );
      final toggleIsDefaultResponse = await client
          .from('delivery_address')
          .select<PostgrestList>()
          .neq('id', id);
      for (int i = 0; i < toggleIsDefaultResponse.length; i++) {
        await client
            .from('delivery_address')
            .update({"is_default": false}).match(
          {'id': toggleIsDefaultResponse[i]['id']},
        );
      }
      await getDeliveryAddress();
      onSuccess();
    } on PostgrestException catch (e) {
      debugPrint(e.message); // todo: handle exception

    } catch (e) {
      debugPrint(e.toString()); // todo: handle exception

    }
  }
}
