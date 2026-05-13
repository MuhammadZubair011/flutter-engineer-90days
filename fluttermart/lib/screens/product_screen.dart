import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttermart/providers/product_provider.dart';
import 'package:fluttermart/screens/product_detail_screen.dart';
import 'package:fluttermart/widgets/common/product_card.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the standard provider to get the full list
    final productAsync = ref.watch(productProvider);
    return Scaffold(
      appBar: AppBar(title: Text('FlutterMart')),

      body: productAsync.when(
        data: (products) {
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                product: product,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(productId: product.id,),
                    ),
                  );
                },
              );
            },
          );
        },
        error: (error, stack) => Center(child: Text('Failed to load : $error')),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
