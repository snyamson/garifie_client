import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/providers/app_routes.dart';
import 'package:garifie_client/utils/constants/globals.dart';
import 'package:garifie_client/utils/theme/app_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
