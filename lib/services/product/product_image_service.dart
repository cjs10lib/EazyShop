import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

class ProductImageService {
   final _storage = FirebaseStorage.instance;
  final uuid = Uuid();
  final String _storageDirectory = 'images/products/';

  Future<Map<String, dynamic>> createProductImage(
      {@required File productImage, String productId}) async {
        
    print(productId);
    final String productImageId = productId != null ? productId : uuid.v1();

    final String fileName = '$_storageDirectory$productImageId.jpg';
    final StorageReference ref = _storage.ref().child(fileName);

    try {
      final StorageUploadTask uploadTask = ref.putFile(
        productImage,
        StorageMetadata(
          contentLanguage: 'en',
          customMetadata: <String, String>{'activity': 'EazyStore-App'},
        ),
      );
      final String downloadUrl =
          await (await uploadTask.onComplete).ref.getDownloadURL();
      return {'downloadUrl': downloadUrl, 'productImageId': productImageId};
    } catch (error) {
      print('product image upload error ${error.message}');
      throw (error.message);
    }
  }

  Future<void> deleteProductImage({@required String productId}) {
    final String productImageId = productId;
    final String fileName = '$_storageDirectory$productImageId.jpg';
    final StorageReference ref = _storage.ref().child(fileName);

    try {
      return ref.delete();
    } catch (error) {
      print('product image delete error ${error.message}');
      throw (error.message);
    }
  }
}