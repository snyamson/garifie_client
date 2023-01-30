import 'dart:convert';

import 'package:flutter/foundation.dart';

class Product {
  final String? id;
  final String name;
  final String description;
  final int quantity;
  final bool? inStock;
  final String ingredients;
  final String healthBenefit;
  final String productImg;
  final List<Variant> variant;
  Product({
    this.id,
    required this.name,
    required this.description,
    required this.quantity,
    this.inStock,
    required this.ingredients,
    required this.healthBenefit,
    required this.productImg,
    required this.variant,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    int? quantity,
    bool? inStock,
    String? ingredients,
    String? healthBenefit,
    String? productImg,
    List<Variant>? variant,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      inStock: inStock ?? this.inStock,
      ingredients: ingredients ?? this.ingredients,
      healthBenefit: healthBenefit ?? this.healthBenefit,
      productImg: productImg ?? this.productImg,
      variant: variant ?? this.variant,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'quantity': quantity,
      'inStock': inStock,
      'ingredients': ingredients,
      'healthBenefit': healthBenefit,
      'productImg': productImg,
      'variant': variant.map((x) => x.toMap()).toList(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      description: map['description'] as String,
      quantity: map['quantity'] as int,
      inStock: map['in_stock'] != null ? map['in_stock'] as bool : null,
      ingredients: map['ingredients'] as String,
      healthBenefit: map['health_benefit'] as String,
      productImg: map['product_img'] as String,
      variant: List<Variant>.from(
        (map['variant'] as List<dynamic>).map<Variant>(
          (x) => Variant.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, description: $description, quantity: $quantity, inStock: $inStock, ingredients: $ingredients, healthBenefit: $healthBenefit, productImg: $productImg, variant: $variant)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.quantity == quantity &&
        other.inStock == inStock &&
        other.ingredients == ingredients &&
        other.healthBenefit == healthBenefit &&
        other.productImg == productImg &&
        listEquals(other.variant, variant);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        quantity.hashCode ^
        inStock.hashCode ^
        ingredients.hashCode ^
        healthBenefit.hashCode ^
        productImg.hashCode ^
        variant.hashCode;
  }
}

class Variant {
  final String? id;
  final String productId;
  final String type;
  final int amount;
  final String? img;
  Variant({
    this.id,
    required this.productId,
    required this.type,
    required this.amount,
    this.img,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productId': productId,
      'type': type,
      'amount': amount,
      'img': img,
    };
  }

  factory Variant.fromMap(Map<String, dynamic> map) {
    return Variant(
      id: map['id'] != null ? map['id'] as String : null,
      productId: map['product_id'] as String,
      type: map['type'] as String,
      amount: map['amount'] as int,
      img: map['img'] != null ? map['img'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Variant.fromJson(String source) =>
      Variant.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Variant(id: $id, productId: $productId, type: $type, amount: $amount, img: $img)';
  }
}
