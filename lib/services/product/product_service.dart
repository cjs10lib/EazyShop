import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazy_shop/models/timeout.dart';
import 'package:meta/meta.dart';

class ProductService {
  final _db = Firestore.instance;
  final _serverTimestamp = FieldValue.serverTimestamp();

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
      @required String imageUrl}) {
    return _db.collection('products').document(productId).setData({
      'designer': designer,
      'category': category,
      'components': components,
      'title': title,
      'description': description,
      'price': price,
      'sizes': sizes,
      'colors': colors,
      'quantity': quantity,
      'imageUrl': imageUrl,
      'created': _serverTimestamp,
      'lastUpdate': _serverTimestamp
    }).timeout(const Duration(seconds: 30), onTimeout: () {
      final timeoutError = TimeoutErrorMessage(
          message:
              'Slow internet connection detected! Operation has timed out');

      throw (timeoutError);
    }).catchError((error) {
      throw (error.message);
    });
  }
}
