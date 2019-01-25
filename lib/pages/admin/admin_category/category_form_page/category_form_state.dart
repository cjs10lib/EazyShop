import 'package:meta/meta.dart';

class CategoryFormState {
  final bool isLoading;
  final bool isSaveButtonEnabled;
  final String categoryId;
  final String error;

  CategoryFormState(
      {@required this.isLoading,
      @required this.isSaveButtonEnabled,
      @required this.categoryId,
      @required this.error});

  factory CategoryFormState.initial() {
    return CategoryFormState(
      isLoading: false,
      isSaveButtonEnabled: true,
      categoryId: '',
      error: '',
    );
  }

  factory CategoryFormState.loading() {
    return CategoryFormState(
      isLoading: true,
      isSaveButtonEnabled: false,
      categoryId: '',
      error: '',
    );
  }

  factory CategoryFormState.success(String categoryId) {
    return CategoryFormState(
      isLoading: false,
      isSaveButtonEnabled: true,
      categoryId: categoryId,
      error: '',
    );
  }

  factory CategoryFormState.failure(String error) {
    return CategoryFormState(
      isLoading: false,
      isSaveButtonEnabled: true,
      categoryId: '',
      error: error,
    );
  }
}
