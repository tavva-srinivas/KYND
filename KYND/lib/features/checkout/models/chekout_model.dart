import 'package:flutter/material.dart';
import 'address.dart';

class CheckoutDetails {
  String? productId;
  int? price;

  Address? address;

  String? receiverName;
  String? contactInfo;
  String? house_details;

  DateTime? date;
  TimeOfDay? time;
  String? instructions;


  CheckoutDetails({
    this.productId,
    this.price,
    this.receiverName,
    this.contactInfo,
    this.address,
    this.house_details,
    this.date,
    this.time,
    this.instructions
  });

  // Optionally, you can add methods like fromJson, toJson, etc.
  factory CheckoutDetails.fromJson(Map<String, dynamic> json) {
    return CheckoutDetails(
      productId: json['productId'],
      price: json['price'],
      receiverName: json['receiverName'],
      contactInfo: json['contactInfo'],
      house_details: json['house_details'],
      address: json['address'] != null ? Address.fromJson(json['address']) : null,
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      time: json['time'] != null ? TimeOfDay(
        hour: int.parse(json['time'].split(':')[0]),
        minute: int.parse(json['time'].split(':')[1]),
      ) : null,
      instructions: json['instructions']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'price': price,
      'receiverName': receiverName,
      'contactInfo': contactInfo,
      'address': address?.toJson(),
      'house_details': house_details,
      'date': date?.toIso8601String(),
      'time': time != null ? '${time!.hour}:${time!.minute}' : null,
      'instructions':instructions
    };
  }
}
