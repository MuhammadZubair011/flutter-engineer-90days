class Product {
  final String id;
  final String name;
  final double price;
  final String description;
  final String categoryId;
  final String emoji;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.categoryId,
    required this.emoji,
  });

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
}

class CartItem {
  final Product product;
  final int quantity;

  const CartItem({required this.product, required this.quantity});

  CartItem copyWith({int? quantity}) {
    return CartItem(product: product, quantity: quantity ?? this.quantity);
  }

  double get totalPrice => product.price * quantity;

  String get formattedPrice => '\$${totalPrice.toStringAsFixed(2)}';
}
