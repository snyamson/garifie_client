import 'package:flutter/cupertino.dart';
import 'package:garifie_client/core/models/product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductService {
  SupabaseClient client = Supabase.instance.client;

  Future<List<Product>> getProducts() async {
    try {
      final response = client
          .from('product')
          .select<PostgrestList>('*,variant(*)')
          .asStream()
          .map((res) => res.map((e) => Product.fromMap(e)).toList())
          .first;
      return response;
    } on PostgrestException catch (e) {
      debugPrint(e.message); // todo: handle exception
      return [];
    } catch (e) {
      debugPrint(e.toString()); // todo: handle exception
      return [];
    }
  }

  Future<Product> getProductById(String id) async {
    final response = await client
        .from('product')
        .select<PostgrestMap>('*,variant(*)')
        .match({'id': id})
        .single()
        .asStream()
        .map((res) => Product.fromMap(res))
        .first;
    return response;
  }
}
