import 'package:eazy_shop/models/category.dart';
import 'package:eazy_shop/models/product.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_product_form/admin_product_form.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_product_form/admin_product_form_bloc.dart';
import 'package:eazy_shop/repositories/category/category_repository.dart';
import 'package:flutter/material.dart';

class AdminProductFormPage extends StatefulWidget {
  final Product product;

  const AdminProductFormPage({Key key, this.product}) : super(key: key);

  @override
  AdminProductFormPageState createState() {
    return new AdminProductFormPageState();
  }
}

class AdminProductFormPageState extends State<AdminProductFormPage> {
  final _categoryRepository = CategoryRepository();
  AdminProductFormBloc _productFormBloc;

  List<Category> _categories = [];

  @override
  void initState() {
    _productFormBloc = AdminProductFormBloc();

    _categoryRepository.fetchCategories().then((List<Category> categories) {
      setState(() {
        _categories = categories;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _productFormBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('product form ${_categories.length}');
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: AdminProductForm(
            categories: _categories,
            productFormBloc: _productFormBloc,
            product: widget.product,
          ),
        ));
  }
}
