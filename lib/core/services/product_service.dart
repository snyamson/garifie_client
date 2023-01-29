import 'package:supabase_flutter/supabase_flutter.dart';

class ProductService {
  SupabaseClient client = Supabase.instance.client;

  Future<void> fetchProducts() async {
    final PostgrestResponse response = await client.from('product').select();
    print(response);
  }
}
