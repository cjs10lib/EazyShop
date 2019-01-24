import 'dart:async';

import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String categoryId;
  final String image;
  final String title;
  final String description;
  final Function deleteCategory;

  const CategoryItem(
      {Key key,
      @required this.categoryId,
      @required this.image,
      @required this.title,
      @required this.description,
      @required this.deleteCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color _textColor = Colors.grey;
    final Color _cardColor = Color.fromRGBO(42, 44, 49, 1);
    final Color _containerColor1 = Color.fromRGBO(47, 49, 54, 1);
    final Color _containerColor2 = Color.fromRGBO(54, 57, 63, 1);

    Future _openDeleteConfirmationDialog({@required category}) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Delete Category',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              content: Text('Are you sure of deleting $category \'s category?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                RaisedButton(
                  color: Theme.of(context).backgroundColor,
                  textColor: Theme.of(context).primaryColor,
                  child: Text('Delete'),
                  onPressed: () {
                    deleteCategory(categoryId: categoryId);
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }

    Widget _buildCategoryImageStack() {
      return Stack(
        children: <Widget>[
          Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                  color: _containerColor1,
                  borderRadius: BorderRadius.circular(50.0))),
          Positioned(
            top: 5.0,
            left: 5.0,
            child: Container(
                height: 140.0,
                width: 140.0,
                decoration: BoxDecoration(
                    color: _containerColor2,
                    borderRadius: BorderRadius.circular(70.0))),
          ),
          Positioned(
            top: 15.0,
            left: 15.0,
            child: Container(
              height: 120.0,
              width: 120.0,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(60.0)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                child: FadeInImage(
                  image: NetworkImage(image),
                  placeholder: AssetImage('assets/loader/loader.gif'),
                ),
              ),
            ),
          )
        ],
      );
    }

    Widget _buildCategoryDetails() {
      return Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0),
              Text(
                description,
                softWrap: true,
                style:
                    TextStyle(color: _textColor, fontWeight: FontWeight.bold),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Material(
                      elevation: 2.0,
                      color: _containerColor1,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Icon(
                          Icons.edit,
                          color: _textColor,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => _openDeleteConfirmationDialog(category: title),
                    child: Material(
                      elevation: 2.0,
                      color: _containerColor1,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        Material(
          elevation: 1.0,
          child: Container(
            color: _cardColor,
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildCategoryImageStack(),
                _buildCategoryDetails()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
