import 'package:flutter/foundation.dart';

class Property {
  final int id;
  final String propertyName;
  final int price;
  final String location;
  final String image;
  final String propertyDescription;

  Property(
      {required this.id,
      required this.propertyName,
      required this.image,
      required this.location,
      required this.price,
      required this.propertyDescription});

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
        id: json['id'] as int,
        propertyName: json['propertyName'] as String,
        image: json['image'] as String,
        location: json['location'] as String,
        price: json['price'] as int,
        propertyDescription: json['propertyDescription'] as String);
  }
}
