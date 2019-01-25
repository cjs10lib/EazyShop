import 'package:meta/meta.dart';

class AdminProductFormState {
  final bool isLoading;
  final bool isSaveProductButtonEnabled;
  final String productId;
  final String error;

  AdminProductFormState(
      {@required this.isLoading,
      @required this.isSaveProductButtonEnabled,
      @required this.productId,
      @required this.error});

  factory AdminProductFormState.initial() {
    return AdminProductFormState(
      isLoading: false,
      isSaveProductButtonEnabled: true,
      productId: '',
      error: '',
    );
  }

  factory AdminProductFormState.loading() {
    return AdminProductFormState(
      isLoading: true,
      isSaveProductButtonEnabled: false,
      productId: '',
      error: '',
    );
  }

  factory AdminProductFormState.success(String productId) {
    return AdminProductFormState(
      isLoading: false,
      isSaveProductButtonEnabled: true,
      productId: productId,
      error: '',
    );
  }

  factory AdminProductFormState.failure(String error) {
    return AdminProductFormState(
      isLoading: false,
      isSaveProductButtonEnabled: true,
      productId: '',
      error: error,
    );
  }
}
