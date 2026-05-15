import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/product_provider.dart';
import '../screens/product_detail_screen.dart';
import '../screens/cart_screen.dart';
import '../widgets/common/product_card.dart';
import '../widgets/common/cart_badge.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterMart'),
        actions: [
          CartBadge(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen())),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: productAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Failed to load: $error')),
        data: (products) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                product: product,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProductDetailScreen(productId: product.id)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}