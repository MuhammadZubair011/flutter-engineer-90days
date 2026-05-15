
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttermart/core/constants/app_constants.dart';
import 'package:fluttermart/models/product_model.dart';

// Notice <Product, String> -> It returns a Product, and it requires a String parameter
final productDetailProvider = FutureProvider.family<Product, String> ((ref, id) async{

  await Future.delayed(const Duration(milliseconds: 800));

  return AppConstants.fakeProducts.firstWhere(
      (product) => product.id == id,
    orElse: () => throw Exception('Product not found')
  );
});