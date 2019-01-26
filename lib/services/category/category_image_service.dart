import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

class CategoryImageService {
  final _storage = FirebaseStorage.instance;
  final uuid = Uuid();
  final String _storageDirectory = 'images/categories/';

  Future<Map<String, dynamic>> createCategoryImage(
      {@required File categoryImage, String categoryId}) async {
        
    print(categoryId);
    final String categoryImageId = categoryId != null ? categoryId : uuid.v1();

    final String fileName = '$_storageDirectory$categoryImageId.jpg';
    final StorageReference ref = _storage.ref().child(fileName);

    try {
      final StorageUploadTask uploadTask = ref.putFile(
        categoryImage,
        StorageMetadata(
          contentLanguage: 'en',
          customMetadata: <String, String>{'activity': 'EazyStore-App'},
        ),
      );
      final String downloadUrl =
          await (await uploadTask.onComplete).ref.getDownloadURL();
      return {'downloadUrl': downloadUrl, 'categoryImageId': categoryImageId};
    } catch (error) {
      print('category image upload error ${error.message}');
      throw (error.message);
    }
  }

  Future<void> deleteCategoryImage({@required String categoryId}) {
    final String categoryImageId = categoryId;
    final String fileName = '$_storageDirectory$categoryImageId.jpg';
    final StorageReference ref = _storage.ref().child(fileName);

    try {
      return ref.delete();
    } catch (error) {
      print('category image delete error ${error.message}');
      throw (error.message);
    }
  }
}
