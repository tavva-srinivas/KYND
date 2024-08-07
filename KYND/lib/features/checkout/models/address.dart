class Address {
  final String address1;
  final String address2;
  final double latitude;
  final double longitude;
  final String? postalCode;

  Address({
     required this.address1,
    required this.address2,
    required this.latitude,
    required this.longitude,
    this.postalCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      address1: json['address1'],
      address2: json['address2'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      postalCode: json['postalCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address1': address1,
      'address2': address2,
      'latitude': latitude,
      'longitude': longitude,
      'postalCode': postalCode,
    };
  }
}
