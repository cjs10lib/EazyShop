import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class CategoryService {
  final _db = Firestore.instance;
  final _serverTimestamp = FieldValue.serverTimestamp();

  Future<QuerySnapshot> fetchCategories() {
    return _db
        .collection('categories')
        .orderBy('lastUpdate')
        .getDocuments()
        .timeout(const Duration(seconds: 30), onTimeout: () {
      final Map<String, dynamic> timeoutError = {
        'message': 'Slow internet connection detected! Operation has timed out'
      };
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
      final Map<String, dynamic> timeoutError = {
        'message': 'Slow internet connection detected! Operation has timed out'
      };
      throw (timeoutError);
    }).catchError((error) {
      throw (error.message);
    });
  }
}
