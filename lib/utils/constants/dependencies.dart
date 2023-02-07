import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Dependencies {
  static Future<void> init() async {
    // ENVIRONMENT VARIABLES INITIALIZATION
    await dotenv.load();

    // SUPABASE BACKEND INITIALIZATION
    await Supabase.initialize(
      url: dotenv.get('API_URL'),
      anonKey: dotenv.get('ANON_KEY'),
    ).then(
      (value) => debugPrint(value.toString()),
    );
  }

  // SUPABASE CLIENT
  static SupabaseClient supabaseClient = Supabase.instance.client;
}
