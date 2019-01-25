import 'package:eazy_shop/pages/admin/admin_category/categories/categories_page.dart';
import 'package:eazy_shop/pages/admin/admin_category/category_form_page/category_form_page.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_product_form/admin_product_form_page.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_products/admin_products_page.dart';
import 'package:eazy_shop/pages/auth/auth_page.dart';
import 'package:eazy_shop/pages/check_out/check_out.dart';
import 'package:eazy_shop/pages/product/product_details/product_details_page.dart';
import 'package:eazy_shop/pages/product/products/products_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'Quicksand',
          backgroundColor: Color.fromRGBO(32, 34, 37, 1),
          primaryColor: Colors.yellow[700],
          accentColor: Color.fromRGBO(66, 66, 80, 1)),
      // home: ProductsPage(),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => AuthPage(),
        '/products': (BuildContext context) => ProductsPage(),
        '/category': (BuildContext context) => CategoriesPage(),
        '/category-form': (BuildContext context) => CategoryFormPage(),
        '/product': (BuildContext context) => ProductDetailsPage(),
        '/checkout': (BuildContext context) => CheckOutPage(),
        '/admin-products': (BuildContext context) => AdminProductsPage(),
        '/admin-product-form': (BuildContext context) => AdminProductFormPage(),
      }
    );
  }
}
