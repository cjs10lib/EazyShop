import 'package:eazy_shop/pages/admin/admin_product/admin_product_form/admin_product_form.dart';
import 'package:flutter/material.dart';

class AdminProductFormPage extends StatefulWidget {
  @override
  AdminProductFormPageState createState() {
    return new AdminProductFormPageState();
  }
}

class AdminProductFormPageState extends State<AdminProductFormPage> {
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: AdminProductForm()
      ),
    );
  }
}
