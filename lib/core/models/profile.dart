import 'dart:convert';

class Profile {
  final String id;
  final String username;
  final String email;
  final String? address;
  final String? phone;
  final String role;
  final String? token;
  Profile({
    required this.id,
    required this.username,
    required this.email,
    this.address,
    this.phone,
    required this.role,
    this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'address': address,
      'phone': phone,
      'role': role,
      'token': token,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      address: map['address'] != null ? map['address'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      role: map['role'] as String,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(Map<String, dynamic> source) =>
      Profile.fromMap(source);

  Profile copyWith({
    String? id,
    String? username,
    String? email,
    String? address,
    String? phone,
    String? role,
    String? token,
  }) {
    return Profile(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      token: token ?? this.token,
    );
  }

  @override
  String toString() {
    return 'Profile(id: $id, username: $username, email: $email, address: $address, phone: $phone, role: $role, token: $token)';
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.email == email &&
        other.address == address &&
        other.phone == phone &&
        other.role == role &&
        other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        email.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        role.hashCode ^
        token.hashCode;
  }
}
