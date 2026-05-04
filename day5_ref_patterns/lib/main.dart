import 'package:day5_ref_patterns/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day5 _ ref Patterns',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF2196F3), // Blue accent
              brightness: Brightness.light,       // Light theme
            ),
          useMaterial3: true,
        ),
      home: ProductsScreen()
    );
  }
}
