import 'package:eazy_shop/pages/product/product_page.dart';
import 'package:eazy_shop/pages/products/products_page.dart';
import 'package:eazy_shop/pages/shopping_cart/shopping_cart_page.dart';
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
        backgroundColor: Color.fromRGBO(32,34,37,1),
        primaryColor: Colors.yellow[700],
        accentColor: Color.fromRGBO(66, 66, 80, 1)
      ),
      // home: ProductsPage(),
      routes: <String, WidgetBuilder> {
        '/': (BuildContext context) => ProductsPage(),
        '/product': (BuildContext context) => ProductPage(),
        '/shopping-cart': (BuildContext context) => ShoppingCartPage(),
      },
    );
  }
}