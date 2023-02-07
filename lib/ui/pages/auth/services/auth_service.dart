import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/ui/shared/widgets/show_snack_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  final SupabaseClient client;

  AuthService(this.client);

  Future<User?> getAccount() async {
    try {
      return client.auth.currentUser;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<void> registerUser(
    String email,
    String password,
    String username,
    BuildContext context,
  ) async {
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
    } on AuthException catch (e) {
      // showSnackBar(context, e.toString());
      Fluttertoast.showToast(
          msg: e.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      // showSnackBar(context, e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> loginUser(
    String email,
    String password,
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      AuthResponse response = await client.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (response.user != null) {
        //final currentUser = await getAccount();
      }
    } on AuthException catch (e) {
      showSnackBar(context, e.message);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
