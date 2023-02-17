// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DeliveryAddress {
  final String? id;
  final String? userId;
  final String contactName;
  final String mobileNumber;
  final String streetName;
  final String region;
  final String city;
  final bool isDefault;
  DeliveryAddress({
    this.id,
    this.userId,
    required this.contactName,
    required this.mobileNumber,
    required this.streetName,
    required this.region,
    required this.city,
    required this.isDefault,
  });

  DeliveryAddress copyWith({
    String? id,
    String? userId,
    String? contactName,
    String? mobileNumber,
    String? streetName,
    String? region,
    String? city,
    bool? isDefault,
  }) {
    return DeliveryAddress(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      contactName: contactName ?? this.contactName,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      streetName: streetName ?? this.streetName,
      region: region ?? this.region,
      city: city ?? this.city,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'contactName': contactName,
      'mobileNumber': mobileNumber,
      'streetName': streetName,
      'region': region,
      'city': city,
      'isDefault': isDefault,
    };
  }

  factory DeliveryAddress.fromMap(Map<String, dynamic> map) {
    return DeliveryAddress(
      id: map['id'] != null ? map['id'] as String : null,
      userId: map['user_id'] as String,
      contactName: map['contact_name'] as String,
      mobileNumber: map['mobile_number'] as String,
      streetName: map['street'] as String,
      region: map['region'] as String,
      city: map['city'] as String,
      isDefault: map['is_default'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryAddress.fromJson(String source) =>
      DeliveryAddress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DeliveryAddress(id: $id, userId: $userId, contactName: $contactName, mobileNumber: $mobileNumber, streetName: $streetName, region: $region, city: $city, isDefault: $isDefault)';
  }

  @override
  bool operator ==(covariant DeliveryAddress other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.contactName == contactName &&
        other.mobileNumber == mobileNumber &&
        other.streetName == streetName &&
        other.region == region &&
        other.city == city &&
        other.isDefault == isDefault;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        contactName.hashCode ^
        mobileNumber.hashCode ^
        streetName.hashCode ^
        region.hashCode ^
        city.hashCode ^
        isDefault.hashCode;
  }
}
