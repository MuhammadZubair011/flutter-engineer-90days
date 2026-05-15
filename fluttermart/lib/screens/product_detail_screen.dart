import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/product_detail_provider.dart';
import '../providers/favorites_provider.dart';
import '../providers/cart_provider.dart';

class ProductDetailScreen extends ConsumerWidget {
  final String productId;
  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(productDetailProvider(productId));
    final isFavorite = ref.watch(favoriteProvider.notifier).isFavorite(productId);
    final isInCart = ref.watch(cartProvider.notifier).isInCart(productId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          IconButton(
            onPressed: () => ref.read(favoriteProvider.notifier).toggleFavorite(productId),
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.redAccent : Colors.white,
            ),
          ),
        ],
      ),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (product) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 120, height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(child: Text(product.emoji, style: const TextStyle(fontSize: 64))),
                  ),
                ),
                const SizedBox(height: 24),
                Text(product.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(product.formattedPrice, style: const TextStyle(fontSize: 24, color: Color(0xFF2196F3), fontWeight: FontWeight.w900)),
                const SizedBox(height: 24),
                const Text('About this item', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(product.description, style: const TextStyle(fontSize: 15, height: 1.6, color: Colors.black87)),
                const SizedBox(height: 24),
                if (isFavorite)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.redAccent)),
                    child: const Row(mainAxisSize: MainAxisSize.min, children: [
                      Icon(Icons.favorite, color: Colors.redAccent, size: 14),
                      SizedBox(width: 4),
                      Text('In your favorites', style: TextStyle(color: Colors.redAccent, fontSize: 12)),
                    ]),
                  ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: isInCart ? null : () {
                      ref.read(cartProvider.notifier).addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('${product.name} added to cart!'),
                        backgroundColor: const Color(0xFF2196F3),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        duration: const Duration(seconds: 2),
                      ));
                    },
                    icon: Icon(isInCart ? Icons.check_rounded : Icons.add_shopping_cart_rounded),
                    label: Text(isInCart ? 'Added to Cart' : 'Add to Cart'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2196F3),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      disabledBackgroundColor: Colors.grey.shade300,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}