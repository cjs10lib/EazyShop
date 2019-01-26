import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eazy_shop/models/product.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_products/admin_products_event.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_products/admin_products_state.dart';
import 'package:eazy_shop/repositories/product/product_repository.dart';

class AdminProductsBloc extends Bloc<AdminProductsEvent, AdminProductsState> {
  final _productRepository = ProductRepository();

  @override
  AdminProductsState get initialState => AdminProductsState.initial();

  void onFetchProducts() {
    dispatch(FetchProducts());
  }

  @override
  Stream<AdminProductsState> mapEventToState(
      AdminProductsState currentState, AdminProductsEvent event) async* {
    if (event is FetchProducts) {
      yield AdminProductsState.initial();

      try {
        List<Product> products = await _productRepository.fetchProducts();
        yield AdminProductsState.success(products);
      } catch (error) {
        yield AdminProductsState.failure(error);
      }
    }
  }
}
