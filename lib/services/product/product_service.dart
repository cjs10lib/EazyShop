import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazy_shop/models/timeout.dart';
import 'package:meta/meta.dart';

class ProductService {
  final _db = Firestore.instance;
  final _serverTimestamp = FieldValue.serverTimestamp();

  Future<DocumentReference> createProduct(
      {@required designer,
      @required category,
      @required components,
      @required title,
      @required description,
      @required price,
      @required quantity}) {
    return _db.collection('products').add({
      'designer': designer,
      'category': category,
      'components': components,
      'title': title,
      'description': description,
      'price': price,
      'quantity': quantity,
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
