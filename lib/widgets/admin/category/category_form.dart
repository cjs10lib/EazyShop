import 'package:flutter/material.dart';

class CategoryForm extends StatefulWidget {
  final Function openGalleryOptionBottomSheet;

  const CategoryForm({Key key, @required this.openGalleryOptionBottomSheet})
      : super(key: key);

  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  final Color _textColor = Colors.grey;
  final _controlColor = Color.fromRGBO(47, 49, 54, 1);
  final Color _cardColor = Color.fromRGBO(42, 44, 49, 1);
  final Color _containerColor1 = Color.fromRGBO(47, 49, 54, 1);
  final Color _containerColor2 = Color.fromRGBO(54, 57, 63, 1);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).backgroundColor,
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
                                  Color(0xA0000000), BlendMode.multiply))),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Theme.of(context).primaryColor,
                            size: 40.0,
                          ),
                          onPressed: () {
                            print('addPhoto');
                            widget.openGalleryOptionBottomSheet(
                                context: context);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 40.0,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    )
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
