import '../entities/product.dart';

abstract class IProductRepository {
  Future<ProductListResponse> getProducts({String? filter});
  Future<Product> getProduct(String id);
}