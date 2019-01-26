import 'package:eazy_shop/pages/admin/admin_product/admin_products/widgets/admin_product_item.dart';
import 'package:flutter/material.dart';

class AdminProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) {
          return AdminProductItem(
            productIndex: index,
          );
        },
      );
  }
}