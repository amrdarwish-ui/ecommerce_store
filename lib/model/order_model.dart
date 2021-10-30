class OrderModel {
  bool isDeliverd;
  String uid;
  String address;
  String phone;
  double total;
  List<Map> orders;
  OrderModel({
    required this.isDeliverd,
    required this.uid,
    required this.address,
    required this.phone,
    required this.total,
    required this.orders,
  });

  Map<String, dynamic> toMap() {
    return {
      'isDeliverd': isDeliverd,
      'uid': uid,
      'address': address,
      'phone': phone,
      'total': total,
      'orders': orders,
    };
  }

  factory OrderModel.fromMap(map) {
    return OrderModel(
      isDeliverd: map['isDeliverd'],
      uid: map['uid'],
      address: map['address'],
      phone: map['phone'],
      total: map['total'],
      orders: List<Map>.from(map['orders']?.map((x) => x)),
    );
  }
}
