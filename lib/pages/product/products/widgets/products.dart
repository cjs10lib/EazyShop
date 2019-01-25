import 'package:eazy_shop/pages/product/products/widgets/product_item.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<Widget> _buildProductList() {
    final products = List<Widget>.generate(10, (int index) {
      return ProductItem(
        productIndex: index,
      );
    });

    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildProductList(),
    );
  }
}
