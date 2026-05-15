
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttermart/models/product_model.dart';

class CartNotifier extends Notifier<Map<String, CartItem>>{
  @override
  Map<String, CartItem> build() => {};

  void addToCart (Product product){
    final current = state[product.id];
    // Already in cart → increase quantity

    if(current != null){
      state = {...state, product.id : current.copyWith(quantity: current.quantity+1)};
    }
    // New item → add with quantity 1

    else{
      state = {
        ...state, product.id : CartItem(product: product, quantity: 1),
      };
    }
  }

  void removeOne(String productId){
    final current = state[productId];

    if(current == null) return;

    if(current.quantity <= 1){
      removeFromCart(productId);
    }
    else {
      state = {
        ...state, productId : current.copyWith(quantity: current.quantity-1),
      };
    }
  }

  void removeFromCart(String productId){
    final newState = Map<String, CartItem>.from(state);

    newState.remove(productId);
    state= newState;
  }

  void clearCart ()=> state= {};

// ── Computed getters ───────────────────────────────────────

bool isInCart (String productId) => state.containsKey(productId);
int quantityOf (String productId) => state[productId]?.quantity ?? 0;
List<CartItem> get item => state.values.toList();

int get totalItems => state.values.fold(0, (sum, item) => sum + item.quantity);

double get totalPrice => state.values.fold(0, (sum, item) => sum + item.totalPrice);

  String get formattedTotal => '\$${totalPrice.toStringAsFixed(2)}';
}

final cartProvider = NotifierProvider<CartNotifier, Map<String, CartItem>>(
    CartNotifier.new
);