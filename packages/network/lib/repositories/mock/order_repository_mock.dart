import 'package:domain/entities/order.dart';
import 'package:domain/repositories/i_order_repository.dart';

class OrderRepositoryMock implements IOrderRepository {
  @override
  Future<Order> createOrder(String productId, int count) async {
    await Future.delayed(const Duration(seconds: 2));
    return Order(
      id: 'order_${DateTime.now().millisecondsSinceEpoch}',
      productId: productId,
      count: count,
      userId: '2',
    );
  }
}