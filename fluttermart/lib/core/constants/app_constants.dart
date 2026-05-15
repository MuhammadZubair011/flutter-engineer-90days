// This fake data acts as our temporary database so we can test Riverpod.

import 'package:fluttermart/models/product_model.dart';

class AppConstants {
  static const List<Product> fakeProducts = [
    Product(
      id: 'p1',
      name: 'Wireless Noise-Cancelling Headphones',
      price: 199.99,
      description:
      'Experience pure silence with our top-tier active noise cancellation technology. Perfect for deep work and travel.',
      categoryId: 'c1',
      emoji: '🎧',
    ),
    Product(
      id: 'p2',
      name: 'Mechanical Developer Keyboard',
      price: 129.50,
      description:
      'Tactile blue switches provide the ultimate typing experience for writing Flutter code all day.',
      categoryId: 'c2',
      emoji: '⌨️',
    ),
    Product(
      id: 'p3',
      name: 'Ultra-wide Curved Monitor',
      price: 450.00,
      description:
      'See your UI code and emulator side-by-side with this massive 34-inch display.',
      categoryId: 'c2',
      emoji: '🖥️',
    ),
    Product(
      id: 'p4',
      name: 'Flutter Dev Book',
      price: 39.99,
      description:
      'The definitive guide to building production-ready Flutter apps with Clean Architecture.',
      categoryId: 'c3',
      emoji: '📚',
    ),
    Product(
      id: 'p5',
      name: 'Ergonomic Mouse',
      price: 79.00,
      description:
      'Reduce wrist strain during long coding sessions with this vertically-designed ergonomic mouse.',
      categoryId: 'c2',
      emoji: '🖱️',
    ),
    Product(
      id: 'p6',
      name: 'Developer Coffee Mug',
      price: 24.99,
      description:
      'Keep your code compiling and your coffee hot. "It works on my machine" edition.',
      categoryId: 'c3',
      emoji: '☕',
    ),
  ];
}
