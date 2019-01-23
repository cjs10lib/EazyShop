import 'dart:async';

import 'package:eazy_shop/widgets/admin/category/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  @override
  CategoriesPageState createState() {
    return new CategoriesPageState();
  }
}

class CategoriesPageState extends State<CategoriesPage> {
  final Color _textColor = Colors.grey;
  final _controlColor = Color.fromRGBO(47, 49, 54, 1);
  final Color _cardColor = Color.fromRGBO(42, 44, 49, 1);
  final Color _containerColor1 = Color.fromRGBO(47, 49, 54, 1);
  final Color _containerColor2 = Color.fromRGBO(54, 57, 63, 1);

  // Future _buildAddCategoryDialog({@required BuildContext context}) {
  //   return showDialog(
  //     barrierDismissible: true,
  //     context: context,
  //     builder: (BuildContext context) {
  //       return CategoryForm(
  //         context: context,
  //         openGalleryOptionBottomSheet: _buildGalleryOptionBottomSheet,
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () => Navigator.of(context).pushNamed('/category-form'),
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: _textColor),
          onPressed: () => Navigator.of(context).pushReplacementNamed('/products')
        ),
        title: Text(
          'Product Categories',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            CategoryItem(
              image: 'assets/images/temp2.jpg',
              title: 'Men',
              description:
                  'Collection of mens wear and everything partaining to men.',
            ),
            CategoryItem(
              image: 'assets/images/temp1.jpg',
              title: 'Women',
              description:
                  'Collection of womens wear and everything partaining to women.',
            ),
            CategoryItem(
              image: 'assets/images/temp5.jpg',
              title: 'Casual Wears',
              description: 'Collection of casual wear.',
            ),
          ],
        ),
      ),
    );
  }
}
