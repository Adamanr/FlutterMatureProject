class Order {
  final String id;
  final String productId;
  final int count;
  final String userId;

  const Order({
    required this.id,
    required this.productId,
    required this.count,
    required this.userId,
  });

  static Order fromJson(Map<String, dynamic> json) => Order(
    id: json['id'] as String,
    productId: json['product_id'] as String,
    count: json['count'] as int,
    userId: json['user_id'] as String,
  );
}