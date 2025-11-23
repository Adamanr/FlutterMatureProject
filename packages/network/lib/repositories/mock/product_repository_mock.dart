import 'dart:convert';

import 'package:domain/entities/product.dart';
import 'package:domain/repositories/i_product_repository.dart';
import 'package:flutter/services.dart';

class ShopRepositoryMock implements IProductRepository {
  @override
  Future<Product> getProduct(String id) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final String data = await rootBundle.loadString('assets/mocks/product_$id.json');
    return Product.fromJson(jsonDecode(data));
  }

  @override
  Future<ProductListResponse> getProducts({String? filter}) async {
    await Future.delayed(const Duration(milliseconds: 600));
    final String data = await rootBundle.loadString('assets/mocks/products.json');
    final json = jsonDecode(data) as Map<String, dynamic>;

    var list = ProductListResponse.fromJson(json);
    if (filter != null && filter.isNotEmpty) {
      list = ProductListResponse(
        items: list.items
            .where((p) => p.title.toLowerCase().contains(filter.toLowerCase()))
            .toList(),
        totalItems: list.items.length,
      );
    }
    return list;
  }
}