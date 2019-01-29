import 'dart:async';
import 'dart:io';

import 'package:eazy_shop/services/product/product_image_service.dart';
import 'package:meta/meta.dart';

class ProductImageRepository {
  final _productImageService = ProductImageService();

  Future<Map<String, dynamic>> createProductImage({@required File productImage, String productId}) async {
    Map<String, dynamic> _productImage;

    try {
      _productImage = await _productImageService.createProductImage(
          productImage: productImage, productId: productId);

      return _productImage;
    } catch (error) {
      print('product image upload repo error ${error.toString()}');
      throw (error.toString());
    }
  }

  Future<void> deleteProductImage({@required String productId}) async {
    try {
      return await _productImageService.deleteProductImage(productId: productId);
    } catch (error) {
      throw (error.toString());
    }
  }
}