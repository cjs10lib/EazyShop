import 'package:eazy_shop/pages/auth/auth_page.dart';
import 'package:eazy_shop/pages/categories/categories_page.dart';
import 'package:eazy_shop/pages/check_out/check_out.dart';
import 'package:eazy_shop/pages/product/product_page.dart';
import 'package:eazy_shop/pages/products/products_page.dart';
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
        '/product': (BuildContext context) => ProductPage(),
        '/checkout': (BuildContext context) => CheckOutPage(),
      },
    );
  }
}
