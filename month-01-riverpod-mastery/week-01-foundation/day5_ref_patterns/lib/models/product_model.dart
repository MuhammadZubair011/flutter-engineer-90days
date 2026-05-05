class Product {
  final String id;
  final String name;
  final double price;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
  });

  String get formattedPrice => 'Rs ${price.toStringAsFixed(0)}';

}

class CartItem {
  final Product product;
  final int quantity;

  CartItem({required this.product, required this.quantity});

  CartItem copyWith({int? quantity}) {
    return CartItem(product: product, quantity: quantity ?? this.quantity);
  }

  double get totalPrice => product.price*quantity;
  String get formattedTotal => 'Rs ${totalPrice.toStringAsFixed(0)}';
}
