import 'package:domain/entities/cart.dart';
import 'package:domain/repositories/i_cart_repository.dart';
import 'package:hive/hive.dart';

class CartRepositoryMock implements ICartRepository {
  static const _boxName = 'cart_box';

  Future<Box> _box() => Hive.isBoxOpen(_boxName)
      ? Future.value(Hive.box(_boxName))
      : Hive.openBox(_boxName);

  @override
  Future<void> addToCart(String productId, int count) async {
    final box = await _box();
    final id = '${productId}_cart';
    final existing = box.get(id) as Map<String, dynamic>?;
    final newCount = (existing?['count'] as int? ?? 0) + count;
    await box.put(id, {'id': id, 'productId': productId, 'count': newCount});
  }

  @override
  Future<List<CartItem>> getCart() async {
    final box = await _box();
    return box.values.map((e) {
      final map = e as Map<String, dynamic>;
      return CartItem(
        id: map['id'] as String,
        productId: map['productId'] as String,
        count: map['count'] as int,
        userId: map['user_id'] as String,
      );
    }).toList();
  }

  @override
  Future<void> updateCartItem(String cartId, int count) async {
    final box = await _box();
    if (count <= 0) {
      await box.delete(cartId);
    } else {
      final item = box.get(cartId) as Map<String, dynamic>?;
      if (item != null) {
        await box.put(cartId, {...item, 'count': count});
      }
    }
  }

  @override
  Future<void> removeFromCart(String cartId) async {
    final box = await _box();
    await box.delete(cartId);
  }
}