// This fake data acts as our temporary database so we can test Riverpod.

import 'package:fluttermart/models/product_model.dart';

class AppConstants {
  static const List<Product> fakeProduct = [
    Product(
      id: 'p1',
      name: 'Wireless Noice_Cancelling Headphones',
      price: 199.99,
      description:
          'Experience pure silence with our top-tier active noise cancellation technology. Perfect for deep work and travel.',
      categoryId: 'c1',
    ),

    Product(
      id: 'p2',
      name: 'Mechanical Developer Keyboard',
      price: 129.50,
      description: 'Tactile blue switches provide the ultimate typing experience for writing Flutter code all day.',
      categoryId: 'c2',
    ),

    Product(
      id: 'p3',
      name: 'Ultra-wide Curved Monitor',
      price: 450.00,
      description: 'See your UI code and emulator side-by-side with this massive 34-inch display.',
      categoryId: 'c2',
    ),
  ];
}
