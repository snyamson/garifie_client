import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/providers/app_routes.dart';
import 'package:garifie_client/utils/constants/globals.dart';
import 'package:garifie_client/utils/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Supabase.initialize(
    url: dotenv.get('API_URL'),
    anonKey: dotenv.get('ANON_KEY'),
  ).then(
    (value) => print(value),
  );
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
