import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class CategoryService {
  final _db = Firestore.instance;
  final _serverTimestamp = FieldValue.serverTimestamp();

  Future<DocumentReference> createCategory(
      {@required String title, @required String description}) {
    return _db.collection('categories').add({
      'title': title,
      'description': description,
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
