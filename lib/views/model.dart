import 'package:flutter/material.dart';

class Promodel {
  String? image;
  String? name;
  String? prize;
  // bool isfav = false;
  int product;
  num delivery;

  // String? rating;

  Promodel(
      {this.image,
        this.name,
        this.prize,
        // required this.isfav,
        required this.product,
        required this.delivery});

  factory Promodel.frommap(Map<String, dynamic> map) {
    return Promodel(
      image: map["image"],
      name: map["name"],
      prize: map["prize"],
      delivery: 3.5,
      product: map["product"??0],
      // isfav: map["favorite"],
    );
  }
}
