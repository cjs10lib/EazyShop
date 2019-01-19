import 'dart:async';

import 'package:eazy_shop/widgets/category/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final Color _textColor = Colors.grey;
  final _controlColor = Color.fromRGBO(47, 49, 54, 1);
  final Color _cardColor = Color.fromRGBO(42, 44, 49, 1);
  final Color _containerColor1 = Color.fromRGBO(47, 49, 54, 1);
  final Color _containerColor2 = Color.fromRGBO(54, 57, 63, 1);

  Future _buildAddCategoryDialog({@required BuildContext context}) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Theme.of(context).backgroundColor,
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.only(
            //         bottomRight: Radius.circular(50.0),
            //         bottomLeft: Radius.circular(50.0))),
            child: Container(
              height: 340.0,
              width: 350.0,
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 200.0,
                            width: 350.0,
                          ),
                          Container(
                            height: 200.0,
                            width: 350.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/temp1.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Color(0xA0000000),
                                        BlendMode.multiply))),
                          ),
                          Positioned(
                              top: 20.0,
                              right: 20.0,
                              child: IconButton(
                                icon: Icon(
                                  Icons.add_a_photo,
                                  color: Theme.of(context).primaryColor,
                                  size: 40.0,
                                ),
                                onPressed: () {
                                  print('addPhoto');
                                },
                              ))
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: TextField(
                          style: TextStyle(
                              color: _textColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              hintText: 'Category Title',
                              hintStyle: TextStyle(
                                  color: _textColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                              filled: true,
                              fillColor: _controlColor),
                        ),
                      ),
                      // Expanded(child: Container()),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 50.0,
                          width: double.infinity,
                          color: Theme.of(context).primaryColor,
                          alignment: Alignment.center,
                          child: Text(
                            'Save',
                            style: TextStyle(
                                color: _containerColor1,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                      // ButtonBar(
                      //   alignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     Container(
                      //       height: 50.0,
                      //       width: 100,
                      //       color: _containerColor2,
                      //       alignment: Alignment.center,
                      //       child: Text(
                      //         'Cancel',
                      //         style: TextStyle(
                      //             color: _textColor,
                      //             fontSize: 18.0,
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //     Container(
                      //       height: 50.0,
                      //       width: 100,
                      //       color: Theme.of(context).primaryColor,
                      //       alignment: Alignment.center,
                      //       child: Text(
                      //         'Save',
                      //         style: TextStyle(
                      //             color: _containerColor1,
                      //             fontSize: 18.0,
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () {
          print('add category');
          _buildAddCategoryDialog(context: context);
        },
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: _textColor),
          onPressed: () => Navigator.of(context).pop(),
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
