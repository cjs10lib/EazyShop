import 'package:flutter/material.dart';

class ProductCategories extends StatefulWidget {
  @override
  ProductCategoriesState createState() {
    return new ProductCategoriesState();
  }
}

class ProductCategoriesState extends State<ProductCategories> {
  final _controlColor = Color.fromRGBO(47, 49, 54, 1);
  final Color _containerColor1 = Color.fromRGBO(47, 49, 54, 1);
  final Color _containerColor2 = Color.fromRGBO(54, 57, 63, 1);

  final _textColor = Colors.grey;

  Widget _buildCategories() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: <Widget>[
            SizedBox(width: 20.0),
            Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('assets/images/temp$index.jpg'),
                ),
                SizedBox(height: 5.0),
                Expanded(
                  child: Text('Category $index',
                      style: TextStyle(
                          color: _textColor, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Text(
                'Categories',
                style: TextStyle(
                    color: _textColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed('/category'),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: _containerColor1,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0)),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add_circle_outline,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      'Add',
                      style: TextStyle(
                          color: _textColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Container(
          height: 100.0,
          width: double.infinity,
          child: _buildCategories(),
        ),
        // SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Expand Categories',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: Colors.blueGrey,
                size: 30.0,
              )
            ],
          ),
        ),
      ],
    );
  }
}
