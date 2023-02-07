import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/ui/pages/auth/services/auth_service.dart';
import 'package:garifie_client/utils/constants/dependencies.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

final authProvider = Provider<AuthService>(
  (ref) => AuthService(Dependencies.supabaseClient),
);

final userProvider = FutureProvider<User?>((ref) async {
  return ref.watch(authProvider).getAccount();
});
