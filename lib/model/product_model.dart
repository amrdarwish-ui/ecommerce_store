import 'dart:convert';

class Product {
  String name;
  String company;
  String image;
  String color;
  String details;
  List<String> images;
  num price;
  Product({
    required this.name,
    required this.company,
    required this.image,
    required this.color,
    required this.details,
    required this.images,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'company': company,
      'image': image,
      'color': color,
      'details': details,
      'images': images,
      'price': price,
    };
  }

  factory Product.fromMap(map) {
    return Product(
      name: map['name'],
      company: map['company'],
      image: map['image'],
      color: map['color'],
      details: map['details'],
      images: List<String>.from(map['images']),
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
