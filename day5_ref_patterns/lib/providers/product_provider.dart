import 'package:day5_ref_patterns/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productProvider = Provider<List<Product>>((ref) {
  return [
    Product(id: "1", name: 'Flutter Book', price: 2500, category: 'Education'),
    Product(
      id: '2',
      name: 'Mechanical Keyboard',
      price: 8500,
      category: 'Tech',
    ),
    Product(id: '3', name: 'Coffee Mug', price: 800, category: 'Lifestyle'),
    Product(id: '4', name: 'Monitor Stand', price: 3200, category: 'Tech'),
    Product(id: '5', name: 'Notebook', price: 450, category: 'Education'),
    Product(id: '6', name: 'USB Hub', price: 1800, category: 'Tech'),
  ];
});
