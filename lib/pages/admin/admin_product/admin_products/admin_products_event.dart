import 'package:meta/meta.dart';

abstract class AdminProductsEvent {}

class FetchProducts extends AdminProductsEvent {}

class DeleteProduct extends AdminProductsEvent {
  final String productId;

  DeleteProduct({@required this.productId});  
}
