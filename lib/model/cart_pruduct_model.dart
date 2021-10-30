class CartPruduct {
  int? id;
  String name;
  int price;
  int count;
  String image;
  CartPruduct({
    this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.count,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'count': count,
      'image': image
    };
  }

  factory CartPruduct.fromMap(Map<String, dynamic> map) {
    return CartPruduct(
        id: map['id'],
        name: map['name'],
        price: map['price'],
        count: map['count'],
        image: map['image']);
  }
}
