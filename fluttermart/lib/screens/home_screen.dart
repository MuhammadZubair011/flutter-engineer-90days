import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttermart/providers/cart_provider.dart';
import 'package:fluttermart/providers/favorites_provider.dart';
import 'package:fluttermart/screens/cart_screen.dart';
import 'package:fluttermart/screens/favorites_screen.dart';
import 'package:fluttermart/screens/product_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    ProductScreen(),
    FavoritesScreen(),
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final favoriteCount = ref.watch(favoriteProvider).length;
    final cartItems = ref.watch(cartProvider.notifier).totalItems;
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),

      bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) => setState(()=> _currentIndex = index),
          selectedItemColor: const Color(0xFF2196F3),
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.store_rounded), label: 'Products'),
            BottomNavigationBarItem(icon: Badge(
              label: Text('$favoriteCount'),
              isLabelVisible: favoriteCount>0,
              child: Icon(Icons.favorite_border_outlined),
            ),
              activeIcon: Badge(
                label: Text('$favoriteCount'),
                isLabelVisible: favoriteCount > 0,
                child: const Icon(Icons.favorite_rounded),
              ),
              label: 'Favorites',
            ),

            BottomNavigationBarItem(icon: Badge(
              label: Text('$cartItems'),
              isLabelVisible: cartItems >0,
              child: Icon(Icons.shopping_cart_outlined),
            ),
              activeIcon: Badge(
                label: Text('$favoriteCount'),
                isLabelVisible: cartItems > 0,
                child: const Icon(Icons.shopping_cart_rounded),
              ),
              label: 'Cart',
            )

          ]),
    );
  }
}
