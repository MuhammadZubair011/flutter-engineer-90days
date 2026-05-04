import 'package:day5_ref_patterns/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends Notifier<Map<String, CartItem>> {
  @override
  Map<String, CartItem> build() => {};

  // ── ADD to cart ────────────────────────────────────────────
  // If product already in cart → increase quantity
  // If not in cart → add new CartItem with quantity 1
  //

  void addToCart(Product product) {
    final currentItem = state[product.id];

    if (currentItem != null) {
      state = {
        ...state, // spread existing items
        product.id: currentItem.copyWith(quantity: currentItem.quantity + 1),
      };
    } else {
      state = {...state, product.id: CartItem(product: product, quantity: 1)};
    }
  }

  void removeOneFromCart(String productId) {
    final currentItem = state[productId];

    if (currentItem == null) return;

    if (currentItem.quantity <= 1) {
      removeFromCart(productId);
    } else {
      state = {
        ...state,
        productId: currentItem.copyWith(quantity: currentItem.quantity - 1),
      };
    }
  }

  void removeFromCart(String productId) {
    final newState = Map<String, CartItem>.from(state);

    newState.remove(productId);
    state = newState;
  }

  void clearCart() => state = {};

  // ── Computed getters ───────────────────────────────────────
  // Business logic in the Notifier — not in the UI

  double get totalPrice =>
      state.values.fold(0, (sum, item) => sum + item.totalPrice);

  int get totalItems =>
      state.values.fold(0, (sum, item) => sum + item.quantity);

  String get formattedTotal => 'Rs ${totalPrice.toStringAsFixed(0)}';

  // Check if a specific product is in cart
  bool isInCart(String productId) => state.containsKey(productId);

  // Get quantity of a specific product in cart
  int quantityOf(String productId) => state[productId]?.quantity ?? 0;

  List<CartItem> get items => state.values.toList();

}

final cartProvider =NotifierProvider<CartNotifier, Map<String, CartItem>>(
  CartNotifier.new
);
