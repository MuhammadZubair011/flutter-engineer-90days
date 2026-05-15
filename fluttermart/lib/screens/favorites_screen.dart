import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/favorites_provider.dart';
import '../providers/product_provider.dart';
import '../models/product_model.dart';
import 'product_detail_screen.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final favoriteIds = ref.watch(favoriteProvider);
    final productsAsync = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('My Favorites')),
      body: productsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (products) {
          final favorites = products
              .where((p) => favoriteIds.contains(p.id))
              .toList();

          if (favorites.isEmpty) {
            return const _EmptyFavorites();
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              return _FavoriteItem(product: favorites[index]);
            },
          );
        },
      ),
    );
  }
}

class _FavoriteItem extends ConsumerWidget {
  final Product product;
  const _FavoriteItem({required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          width: 48, height: 48,
          decoration: BoxDecoration(color: const Color(0xFFE3F2FD), borderRadius: BorderRadius.circular(10)),
          child: Center(child: Text(product.emoji, style: const TextStyle(fontSize: 24))),
        ),
        title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: Text(product.formattedPrice, style: const TextStyle(color: Color(0xFF2196F3), fontWeight: FontWeight.w700)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Remove from favorites
            IconButton(
              onPressed: () => ref.read(favoriteProvider.notifier).toggleFavorite(product.id),
              icon: const Icon(Icons.favorite, color: Colors.redAccent),
            ),
            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          ],
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ProductDetailScreen(productId: product.id)),
        ),
      ),
    );
  }
}

class _EmptyFavorites extends StatelessWidget {
  const _EmptyFavorites();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('🤍', style: TextStyle(fontSize: 64)),
          SizedBox(height: 16),
          Text('No favorites yet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('Tap the heart on any product', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}