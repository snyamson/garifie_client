// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Cart {
  final String id;
  final String name;
  final String description;
  final String? type;
  final int quantity;
  final int amount;
  final String? img;
  Cart({
    required this.id,
    required this.name,
    required this.description,
    this.type,
    required this.quantity,
    required this.amount,
    this.img,
  });

  Cart copyWith({
    String? id,
    String? name,
    String? description,
    String? type,
    int? quantity,
    int? amount,
    String? img,
  }) {
    return Cart(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      quantity: quantity ?? this.quantity,
      amount: amount ?? this.amount,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'type': type,
      'quantity': quantity,
      'amount': amount,
      'img': img,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      type: map['type'] != null ? map['type'] as String : null,
      quantity: map['quantity'] as int,
      amount: map['amount'] as int,
      img: map['img'] != null ? map['img'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cart(id: $id, name: $name, description: $description, type: $type, quantity: $quantity, amount: $amount, img: $img)';
  }

  @override
  bool operator ==(covariant Cart other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.type == type &&
        other.quantity == quantity &&
        other.amount == amount &&
        other.img == img;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        type.hashCode ^
        quantity.hashCode ^
        amount.hashCode ^
        img.hashCode;
  }
}
