import 'package:eazy_shop/models/category.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_product_form/admin_product_form.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_product_form/admin_product_form_bloc.dart';
import 'package:eazy_shop/repositories/category/category_repository.dart';
import 'package:flutter/material.dart';

class AdminProductFormPage extends StatefulWidget {
  @override
  AdminProductFormPageState createState() {
    return new AdminProductFormPageState();
  }
}

class AdminProductFormPageState extends State<AdminProductFormPage> {
  final _categoryRepository = CategoryRepository();
  AdminProductFormBloc _productFormBloc;

  List<Category> _categories = [];

  // AdminProductFormPageState() {

  // }

  @override
  void initState() {
    _productFormBloc = AdminProductFormBloc();

    _categoryRepository
        .fetchCategories()
        .then((List<Category> categories) => _categories = categories);
    super.initState();
  }

  @override
  void dispose() {
    _productFormBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: AdminProductForm(
            categories: _categories,
            productFormBloc: _productFormBloc,
          ),
        ));
  }
}
