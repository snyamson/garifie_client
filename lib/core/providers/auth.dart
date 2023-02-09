import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/models/profile.dart';
import 'package:garifie_client/core/services/auth_service.dart';
import 'package:garifie_client/utils/constants/dependencies.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

final authProvider = Provider<AuthService>(
  (ref) => AuthService(Dependencies.supabaseClient),
);

final userProvider = FutureProvider<User?>((ref) async {
  return ref.watch(authProvider).getAccount();
});

final profileProvider = StateNotifierProvider<AuthNotifier, Profile>(
  (ref) => AuthNotifier(),
);

final loadingProvider = StateProvider<bool>((ref) => false);
final isUserLoggedInProvider = StateProvider<bool>((ref) => false);

class AuthNotifier extends StateNotifier<Profile> {
  AuthNotifier() : super(Profile(id: '', username: '', email: '', role: ''));
  void setProfile(Map<String, dynamic> profile) {
    Profile userProfile = Profile.fromMap(profile);
    state = userProfile;
  }
}
