import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/providers/app_routes.dart';
import 'package:garifie_client/core/providers/auth.dart';
import 'package:garifie_client/utils/constants/dependencies.dart';
import 'package:garifie_client/utils/constants/globals.dart';
import 'package:garifie_client/utils/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Dependencies.init();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with AfterLayoutMixin<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    ref.read(authProvider).setUserProfile(ref);
    Supabase.instance.client.auth.onAuthStateChange.listen((event) {
      if (event.event == AuthChangeEvent.signedIn) {
        ref.read(isUserLoggedInProvider.notifier).update((state) => true);
      } else if (event.event == AuthChangeEvent.signedOut) {
        ref.read(isUserLoggedInProvider.notifier).update((state) => false);
      } else {
        ref.read(isUserLoggedInProvider.notifier).update((state) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Gari Fie',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: snackbarKey,
      theme: AppTheme.lightTheme,
      routerDelegate: ref.read(appRoutesProvider).routes.routerDelegate,
      routeInformationParser:
          ref.read(appRoutesProvider).routes.routeInformationParser,
      routeInformationProvider:
          ref.read(appRoutesProvider).routes.routeInformationProvider,
    );
  }
}
