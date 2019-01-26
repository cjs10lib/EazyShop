import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazy_shop/services/product/product_service.dart';
import 'package:meta/meta.dart';

class ProductRepository {
  final _productService = ProductService();

  Future<String> createProduct(
      {@required String designer,
      @required String category,
      @required String components,
      @required String title,
      @required String description,
      @required double price,
      @required List<String> sizes,
      @required List<String> colors,
      @required int quantity}) async {
    try {
      DocumentReference documentReference = await _productService.createProduct(
          designer: designer,
          category: category,
          components: components,
          title: title,
          description: description,
          price: price,
          sizes: sizes,
          colors: colors,
          quantity: quantity);

      print(documentReference.documentID);
      return documentReference.documentID;
    } catch (error) {
      throw (error.toString());
    }
  }
}
