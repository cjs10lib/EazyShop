import 'package:eazy_shop/models/category.dart';
import 'package:meta/meta.dart';

class CategoriesState {
  final bool isInitializing;
  final List<Category> categories;
  final bool hasError;
  final String error;

  CategoriesState(
      {@required this.isInitializing,
      @required this.categories,
      @required this.hasError,
      @required this.error});

  factory CategoriesState.initial() {
    return CategoriesState(isInitializing: true, categories: [], hasError: false, error: '');
  }

  factory CategoriesState.success(List<Category> categories) {
    return CategoriesState(
        isInitializing: false, categories: categories, hasError: false, error: '');
  }

  factory CategoriesState.failure(String error) {
    return CategoriesState(isInitializing: false, categories: [], hasError: true, error: error);
  }

  CategoriesState copyWith(
      {bool isInitializing, List<Category> categories, bool hasError, String error}) {
    return CategoriesState(
      isInitializing: isInitializing ?? this.isInitializing,
      categories: categories ?? this.categories,
      hasError: hasError ?? this.hasError,
      error: error ?? this.error,
    );
  }
}
