
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttermart/core/constants/app_constants.dart';
import 'package:fluttermart/models/product_model.dart';

final productProvider = FutureProvider<List<Product>> ((ref) async{
  await Future.delayed(const Duration(milliseconds: 800));

  return AppConstants.fakeProducts;
});