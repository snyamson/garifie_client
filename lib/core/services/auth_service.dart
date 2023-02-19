import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/providers/auth.dart';
import 'package:garifie_client/core/services/user_delivery_address_service.dart';
import 'package:garifie_client/ui/shared/widgets/show_snack_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient client;

  AuthService(this.client);

  UserDeliveryAddressService deliveryAddressService =
      UserDeliveryAddressService();

  Future<User?> getAccount() async {
    print('Log: From getAccountFunction');
    try {
      return client.auth.currentUser;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<void> registerUser({
    required String email,
    required String password,
    required String username,
    required BuildContext context,
    required VoidCallback onSuccess,
    required WidgetRef ref,
  }) async {
    try {
      AuthResponse response = await client.auth.signUp(
        password: password,
        email: email,
      );

      await client.from('profile').insert(
        {
          "id": response.user?.id,
          "email": email,
          "username": username,
        },
      );
      await setUserProfile(ref);
      onSuccess();
      showToast(message: 'Successfully Authenticated', isSuccess: true);
    } on AuthException catch (e) {
      showToast(message: e.message, isSuccess: false);
    } catch (e) {
      showToast(message: e.toString(), isSuccess: false);
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
    required WidgetRef ref,
    required VoidCallback onSuccess,
    required BuildContext context,
  }) async {
    try {
      AuthResponse response = await client.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (response.user != null) {
        await setUserProfile(ref);
        onSuccess();
        showToast(message: 'Successfully Authenticated', isSuccess: true);
      }
    } on AuthException catch (e) {
      showToast(message: e.message, isSuccess: false);
    } catch (e) {
      showToast(message: e.toString(), isSuccess: false);
    }
  }

  Future<void> logoutUser(BuildContext context, WidgetRef ref) async {
    try {
      await client.auth.signOut();
    } on AuthException catch (e) {
      showSnackBar(context, e.message);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<Map<String, dynamic>?> getCurrentUserProfile(String? userId) async {
    print('Log: From getCurrentUserProfile Function');
    if (userId != null) {
      try {
        return await client
            .from('profile')
            .select<PostgrestMap>()
            .eq('id', userId)
            .single();
      } on PostgrestException catch (e) {
        debugPrint(e.toString());
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    return null;
  }

  Future<void> setUserProfile(WidgetRef ref) async {
    final currentUser = await getAccount();
    if (currentUser != null) {
      final userProfile = await getCurrentUserProfile(currentUser.id);
      final address = await deliveryAddressService.getDeliveryAddress();
      if (userProfile != null) {
        ref.read(profileProvider.notifier).setProfile(userProfile);
        ref.read(profileProvider.notifier).setDeliveryAddress(address);
      }
    } else {
      print('No User');
    }
  }
}
