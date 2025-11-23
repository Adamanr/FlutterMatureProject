import '../entities/order.dart';

abstract class IOrderRepository {
  Future<Order> createOrder(String productId, int count);
}