// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:garifie_client/core/models/delivery_address.dart';

class Profile {
  final String id;
  final String username;
  final String email;
  final String? phone;
  final String role;
  final String? token;
  final List<DeliveryAddress> address;
  Profile({
    required this.id,
    required this.username,
    required this.email,
    this.phone,
    required this.role,
    this.token,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'phone': phone,
      'role': role,
      'token': token,
      'address': [],
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      phone: map['phone'] != null ? map['phone'] as String : null,
      role: map['role'] as String,
      token: map['token'] != null ? map['token'] as String : null,
      address: [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  Profile copyWith({
    String? id,
    String? username,
    String? email,
    String? phone,
    String? role,
    String? token,
    List<DeliveryAddress>? address,
  }) {
    return Profile(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      token: token ?? this.token,
      address: address ?? this.address,
    );
  }

  @override
  String toString() {
    return 'Profile(id: $id, username: $username, email: $email, phone: $phone, role: $role, token: $token, address: $address)';
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.email == email &&
        other.phone == phone &&
        other.role == role &&
        other.token == token &&
        listEquals(other.address, address);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        role.hashCode ^
        token.hashCode ^
        address.hashCode;
  }
}
