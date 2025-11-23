import '../entities/cart.dart';

abstract class ICartRepository {
  Future<void> addToCart(String productId, int count);
  Future<List<CartItem>> getCart();
  Future<void> updateCartItem(String cartId, int count);
  Future<void> removeFromCart(String cartId);
}