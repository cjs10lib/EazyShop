import 'package:eazy_shop/models/product.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_product_form/admin_product_form.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_product_form/admin_product_form_bloc.dart';
import 'package:flutter/material.dart';

class AdminProductFormPage extends StatefulWidget {
  final Product product;

  const AdminProductFormPage({Key key, this.product}) : super(key: key);

  @override
  AdminProductFormPageState createState() => AdminProductFormPageState();
}

class AdminProductFormPageState extends State<AdminProductFormPage> {
  AdminProductFormBloc _productFormBloc;

  AdminProductForm _productForm;

  @override
  void initState() {
    _productFormBloc = AdminProductFormBloc();

    _productForm = AdminProductForm(
      productFormBloc: _productFormBloc,
      product: widget.product,
    );

    super.initState();
  }

  @override
  void dispose() {
    _productFormBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('product form ${_categories.length}');
    print('product form');
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: _productForm),
    );
  }
}
