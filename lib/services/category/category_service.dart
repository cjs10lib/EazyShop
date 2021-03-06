import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazy_shop/models/timeout.dart';
import 'package:meta/meta.dart';

class CategoryService {
  final _db = Firestore.instance;
  final _serverTimestamp = FieldValue.serverTimestamp();

  Future<QuerySnapshot> fetchCategories() {
    return _db
        .collection('categories')
        .orderBy('lastUpdate', descending: true)
        .getDocuments()
        .timeout(const Duration(seconds: 30), onTimeout: () {
      final timeoutError = TimeoutErrorMessage(
          message:
              'Slow internet connection detected! Operation has timed out');

      throw (timeoutError);
    }).catchError((error) {
      throw (error.message);
    });
  }

  Future<void> createCategory(
      {@required String categoryId,
      @required String title,
      @required String description,
      @required String imageUrl}) {
    return _db.collection('categories').document(categoryId).setData({
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'created': _serverTimestamp,
      'lastUpdate': _serverTimestamp,
    }).timeout(const Duration(seconds: 30), onTimeout: () {
      final timeoutError = TimeoutErrorMessage(
          message:
              'Slow internet connection detected! Operation has timed out');

      throw (timeoutError);
    }).catchError((error) {
      throw (error.message);
    });
  }

  Future<void> updateCategory(
      {@required String categoryId,
      @required String title,
      @required String description,
      @required String imageUrl}) {
    if (imageUrl != null) {
      return _db.collection('categories').document(categoryId).setData({
        'title': title,
        'description': description,
        'imageUrl': imageUrl,
        'lastUpdate': _serverTimestamp,
      }, merge: true).timeout(const Duration(seconds: 30), onTimeout: () {
        final timeoutError = TimeoutErrorMessage(
            message:
                'Slow internet connection detected! Operation has timed out');

        throw (timeoutError);
      }).catchError((error) {
        throw (error.message);
      });
    } else {
      return _db.collection('categories').document(categoryId).setData({
        'title': title,
        'description': description,
        'lastUpdate': _serverTimestamp,
      }, merge: true).timeout(const Duration(seconds: 30), onTimeout: () {
        final timeoutError = TimeoutErrorMessage(
            message:
                'Slow internet connection detected! Operation has timed out');

        throw (timeoutError);
      }).catchError((error) {
        throw (error.message);
      });
    }
  }

  Future<void> deleteCategory({@required categoryId}) {
    return _db
        .collection('categories')
        .document(categoryId)
        .delete()
        .timeout(const Duration(seconds: 30), onTimeout: () {
      final timeoutError = TimeoutErrorMessage(
          message:
              'Slow internet connection detected! Operation has timed out');

      throw (timeoutError);
    }).catchError((error) {
      throw (error.message);
    });
  }
}
