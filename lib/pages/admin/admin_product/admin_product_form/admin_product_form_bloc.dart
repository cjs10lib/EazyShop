import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_product_form/admin_product_form_event.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_product_form/admin_product_form_state.dart';
import 'package:eazy_shop/repositories/product/product_image_repository.dart';
import 'package:eazy_shop/repositories/product/product_repository.dart';
import 'package:meta/meta.dart';

class AdminProductFormBloc
    extends Bloc<AdminProductFormEvent, AdminProductFormState> {
  final _productRepository = ProductRepository();
  final _productImageRepository = ProductImageRepository();

  @override
  AdminProductFormState get initialState => AdminProductFormState.initial();

  void onCreateProduct(
      {@required File image,
      @required String designer,
      @required String categoryId,
      @required String categoryName,
      @required String components,
      @required String title,
      @required String description,
      @required double price,
      @required List<String> sizes,
      @required List<String> colors,
      @required int quantity}) {
    dispatch(CreateProduct(
      image: image,
      designer: designer,
      categoryId: categoryId,
      categoryName: categoryName,
      components: components,
      title: title,
      description: description,
      price: price,
      sizes: sizes,
      colors: colors,
      quantity: quantity,
    ));
  }

  void onCreatedProduct() {
    dispatch(CreatedProduct());
  }

  void onUpdateProduct(
      {@required String productId,
      @required File image,
      @required String designer,
      @required String categoryId,
      @required String categoryName,
      @required String components,
      @required String title,
      @required String description,
      @required double price,
      @required List<String> sizes,
      @required List<String> colors,
      @required int quantity}) {
    dispatch(UpdateProduct(
      productId: productId,
      image: image,
      designer: designer,
      categoryId: categoryId,
      categoryName: categoryName,
      components: components,
      title: title,
      description: description,
      price: price,
      sizes: sizes,
      colors: colors,
      quantity: quantity,
    ));
  }

  @override
  Stream<AdminProductFormState> mapEventToState(
      AdminProductFormState currentState, AdminProductFormEvent event) async* {
    if (event is CreateProduct) {
      yield AdminProductFormState.loading();
      Map<String, dynamic> _productImage;

      try {
        // create category image
        _productImage = await _productImageRepository.createProductImage(
            productImage: event.image);

        print(_productImage['productImageId']);

        await _productRepository.createProduct(
            productId: _productImage['productImageId'],
            designer: event.designer,
            categoryId: event.categoryId,
            categoryName: event.categoryName,
            components: event.components,
            title: event.title,
            description: event.description,
            price: event.price,
            sizes: event.sizes,
            colors: event.colors,
            quantity: event.quantity,
            imageUrl: _productImage['downloadUrl']);

        yield AdminProductFormState.success(_productImage['productImageId']);
      } catch (error) {
        yield AdminProductFormState.failure(error);
      }
    }

    if (event is CreatedProduct) {
      yield AdminProductFormState.initial();
    }

    if (event is UpdateProduct) {
      yield AdminProductFormState.loading();
      Map<String, dynamic> _productImage;
      print(event.image.toString());

      try {
        if (event.image != null) {
          // delete image
          await _productImageRepository.deleteProductImage(
              productId: event.productId);

          // create new image
          _productImage = await _productImageRepository.createProductImage(
              productImage: event.image, productId: event.productId);
        }

        await _productRepository.updateProduct(
            productId: event.productId,
            designer: event.designer,
            categoryId: event.categoryId,
            categoryName: event.categoryName,
            components: event.components,
            title: event.title,
            description: event.description,
            price: event.price,
            sizes: event.sizes,
            colors: event.colors,
            quantity: event.quantity,
            imageUrl: _productImage != null
              ? _productImage['downloadUrl']
              : null,);

        yield AdminProductFormState.success(event.productId);
      } catch (error) {
        yield AdminProductFormState.failure(error.toString());
      }
    }
  }
}
