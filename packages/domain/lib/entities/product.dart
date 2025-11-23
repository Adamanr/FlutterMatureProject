class ProductItem {
  final String id;
  final String title;
  final int price;
  final String typeCloses;
  final String type;

  const ProductItem({
    required this.id,
    required this.title,
    required this.price,
    required this.typeCloses,
    required this.type,
  });

  static ProductItem fromJson(Map<String, dynamic> json) => ProductItem(
    id: json['id'] as String,
    title: json['title'] as String,
    price: json['price'] as int,
    typeCloses: json['typeCloses'] as String? ?? '',
    type: json['type'] as String? ?? '',
  );
}

class Product {
  final String id;
  final String title;
  final String description;
  final int price;
  final String typeCloses;
  final String type;
  final String approximateCost;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.typeCloses,
    required this.type,
    required this.approximateCost,
  });

  static Product fromJson(Map<String, dynamic> json) => Product(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String? ?? '',
    price: json['price'] as int,
    typeCloses: json['typeCloses'] as String? ?? '',
    type: json['type'] as String? ?? '',
    approximateCost: json['approximateCost'] as String? ?? '',
  );
}

class ProductListResponse {
  final List<ProductItem> items;
  final int totalItems;

  const ProductListResponse({required this.items, required this.totalItems});

  static ProductListResponse fromJson(Map<String, dynamic> json) => ProductListResponse(
    items: (json['items'] as List).map((e) => ProductItem.fromJson(e)).toList(),
    totalItems: json['totalItems'] as int,
  );
}