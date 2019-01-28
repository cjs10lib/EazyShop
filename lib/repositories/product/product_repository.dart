import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazy_shop/models/product.dart';
import 'package:eazy_shop/services/product/product_service.dart';
import 'package:meta/meta.dart';

class ProductRepository {
  final _productService = ProductService();

  Future<List<Product>> fetchProducts() async {
    try {
      QuerySnapshot snapshot = await _productService.fetchProducts();
      final List<DocumentSnapshot> _documentsSnap = snapshot.documents;

      List<Product> products = [];

      _documentsSnap.forEach((DocumentSnapshot document) {
        Map<String, dynamic> productData = document.data;

        final product = Product(
          productId: document.documentID,
          designer: productData['designer'],
          category: productData['category'],
          components: productData['components'],
          title: productData['title'],
          description: productData['description'],
          price: productData['price'],
          sizes: productData['sizes'],
          colors: productData['colors'],
          quantity: productData['quantity'],
          imageUrl: productData['imageUrl'],
          created: productData['created'],
          lastUpdate: productData['lastUpdate'],
        );

        products.add(product);
      });

      return products;
    } catch (error) {
      throw (error.toString());
    }
  }

  Future<void> createProduct(
      {@required String productId,
      @required String designer,
      @required String category,
      @required String components,
      @required String title,
      @required String description,
      @required double price,
      @required List<String> sizes,
      @required List<String> colors,
      @required int quantity,
      @required String imageUrl}) async {
    try {
      return await _productService.createProduct(
          productId: productId,
          designer: designer,
          category: category,
          components: components,
          title: title,
          description: description,
          price: price,
          sizes: sizes,
          colors: colors,
          quantity: quantity,
          imageUrl: imageUrl);
    } catch (error) {
      throw (error.toString());
    }
  }

  Future<void> deleteProduct({@required String productId}) async {
    try {
      return await _productService.deleteProduct(productId: productId);
    } catch (error) {
      throw (error.toString());
    }
  }
}
