import 'package:eazy_shop/models/product.dart';
import 'package:meta/meta.dart';

class AdminProductsState {
  final bool isInitializing;
  final List<Product> products;
  final bool hasError;
  final String error;

  AdminProductsState(
      {@required this.isInitializing,
      @required this.products,
      @required this.hasError,
      @required this.error});

  factory AdminProductsState.initial() {
    return AdminProductsState(
      isInitializing: true,
      products: [],
      hasError: false,
      error: '',
    );
  }

  factory AdminProductsState.success(List<Product> products) {
    return AdminProductsState(
      isInitializing: false,
      products: products,
      hasError: false,
      error: '',
    );
  }

  factory AdminProductsState.failure(String error) {
    return AdminProductsState(
      isInitializing: false,
      products: [],
      hasError: true,
      error: error,
    );
  }
}
