import 'dart:async';

import 'package:flutter/material.dart';

class AdminProductFormPage extends StatefulWidget {
  @override
  AdminProductFormPageState createState() {
    return new AdminProductFormPageState();
  }
}

class AdminProductFormPageState extends State<AdminProductFormPage> {
  final Color _textColor = Colors.grey;
  final Color _containerColor1 = Color.fromRGBO(47, 49, 54, 1);
  final Color _containerColor2 = Color.fromRGBO(54, 57, 63, 1);

  List<String> _categories = ['Men', 'Women'];

  String _category;

  // SIZES
  bool sizeXXXL = false;
  bool sizeXXL = false;
  bool sizeXL = false;
  bool sizeL = false;
  bool sizeM = false;

  // COLORS
  bool colorBLACK = false;
  bool colorWHITE = false;
  bool colorGREY = false;
  bool colorRED = false;
  bool colorOTHER = false;

  Widget _buildDesignerTextField() {
    return TextFormField(
      style: TextStyle(color: _textColor, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          labelText: 'Designed by',
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          filled: true,
          fillColor: _containerColor1),
    );
  }

  Widget _buildCategoryTextField() {
    return DropdownButton<String>(
      isExpanded: true,
      hint: Text('Select product category',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold)),
      items: _categories.map((String category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(category,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold)),
        );
      }).toList(),
      value: _category,
      onChanged: (String value) {
        setState(() {
          _category = value;
        });
      },
    );
  }

  Widget _buildComponentsTextField() {
    return TextFormField(
      style: TextStyle(color: _textColor, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          labelText: 'Product Components [e.g. cotton, silk]',
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          filled: true,
          fillColor: _containerColor1),
    );
  }

  Widget _buildTitleTextField({@required BuildContext context}) {
    return TextFormField(
      style: TextStyle(color: _textColor, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          labelText: 'Title',
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          filled: true,
          fillColor: _containerColor1),
    );
  }

  Widget _buildDescriptionTextField({@required BuildContext context}) {
    return TextFormField(
      maxLines: 3,
      keyboardType: TextInputType.multiline,
      style: TextStyle(color: _textColor, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          labelText: 'Description',
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          filled: true,
          fillColor: _containerColor1),
    );
  }

  Widget _buildPriceTextField({@required BuildContext context}) {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: TextStyle(color: _textColor, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          labelText: 'Price',
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          filled: true,
          fillColor: _containerColor1),
    );
  }

  Widget _buildSizeXXXLCheckBox({@required BuildContext context}) {
    return Container(
      child: CheckboxListTile(
        value: sizeXXXL,
        activeColor: Theme.of(context).primaryColor,
        title: Text('XXX-Large',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold)),
        onChanged: (bool value) {
          setState(() {
            sizeXXXL = value;
          });
        },
      ),
    );
  }

  Widget _buildSizeXXLCheckBox({@required BuildContext context}) {
    return Container(
      child: CheckboxListTile(
        value: sizeXXL,
        activeColor: Theme.of(context).primaryColor,
        title: Text('XX-Large',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold)),
        onChanged: (bool value) {
          setState(() {
            sizeXXL = value;
          });
        },
      ),
    );
  }

  Widget _buildSizeXLCheckBox({@required BuildContext context}) {
    return Container(
      child: CheckboxListTile(
        value: sizeXL,
        activeColor: Theme.of(context).primaryColor,
        title: Text('X-Large',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold)),
        onChanged: (bool value) {
          setState(() {
            sizeXL = value;
          });
        },
      ),
    );
  }

  Widget _buildSizeLCheckBox({@required BuildContext context}) {
    return Container(
      child: CheckboxListTile(
        value: sizeL,
        activeColor: Theme.of(context).primaryColor,
        title: Text('Large',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold)),
        onChanged: (bool value) {
          setState(() {
            sizeL = value;
          });
        },
      ),
    );
  }

  Widget _buildSizeMCheckBox({@required BuildContext context}) {
    return Container(
      child: CheckboxListTile(
        value: sizeM,
        activeColor: Theme.of(context).primaryColor,
        title: Text('Medium',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold)),
        onChanged: (bool value) {
          setState(() {
            sizeM = value;
          });
        },
      ),
    );
  }

  Widget _buildProductSizes() {
    return Container(
      height: 150.0,
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          _buildSizeXXXLCheckBox(context: context),
          _buildSizeXXLCheckBox(context: context),
          _buildSizeXLCheckBox(context: context),
          _buildSizeLCheckBox(context: context),
          _buildSizeMCheckBox(context: context),
        ],
      ),
    );
  }

  Widget _buildColorBlackCheckBox({@required BuildContext context}) {
    return Container(
      child: CheckboxListTile(
        value: colorBLACK,
        activeColor: Colors.black,
        title: Text('BLACK',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold)),
        onChanged: (bool value) {
          setState(() {
            colorBLACK = value;
          });
        },
      ),
    );
  }

  Widget _buildColorWhiteCheckBox({@required BuildContext context}) {
    return Container(
      child: CheckboxListTile(
        value: colorWHITE,
        activeColor: Colors.white,
        title: Text('WHITE',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold)),
        onChanged: (bool value) {
          setState(() {
            colorWHITE = value;
          });
        },
      ),
    );
  }

  Widget _buildColorGreyCheckBox({@required BuildContext context}) {
    return Container(
      child: CheckboxListTile(
        value: colorGREY,
        activeColor: Colors.grey,
        title: Text('GREY',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold)),
        onChanged: (bool value) {
          setState(() {
            colorGREY = value;
          });
        },
      ),
    );
  }

  Widget _buildColorRedCheckBox({@required BuildContext context}) {
    return Container(
      child: CheckboxListTile(
        value: colorRED,
        activeColor: Colors.red,
        title: Text('RED',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold)),
        onChanged: (bool value) {
          setState(() {
            colorRED = value;
          });
        },
      ),
    );
  }

  Widget _buildColorOtherCheckBox({@required BuildContext context}) {
    return Container(
      child: CheckboxListTile(
        value: colorOTHER,
        activeColor: Theme.of(context).primaryColor,
        title: Text('OTHER',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold)),
        onChanged: (bool value) {
          setState(() {
            colorOTHER = value;
          });
        },
      ),
    );
  }

  Widget _buildProductColors() {
    return Container(
      height: 150.0,
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          _buildColorBlackCheckBox(context: context),
          _buildColorWhiteCheckBox(context: context),
          _buildColorGreyCheckBox(context: context),
          _buildColorRedCheckBox(context: context),
          _buildColorOtherCheckBox(context: context),
        ],
      ),
    );
  }

  Future _buildGalleryOptionBottomSheet({@required BuildContext context}) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 160.0,
            color: Theme.of(context).backgroundColor,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                Container(
                  width: 100.0,
                  height: 5.0,
                  color: _textColor,
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Open Camera',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Open Gallery',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget _buildQTYTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: TextStyle(color: _textColor, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          labelText: 'Available QTY',
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          filled: true,
          fillColor: _containerColor1),
    );
  }

  Widget _buildProductFormControl() {
    return InkWell(
      onTap: () {
        print('Product Created!');
      },
      child: Container(
        height: 50.0,
        width: double.infinity,
        color: _containerColor2,
        alignment: Alignment.center,
        child: Text(
          'Save',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop()),
              title: Text('Add Product', style: TextStyle(color: Colors.white)),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.add_a_photo,
                    color: Theme.of(context).primaryColor,
                    size: 30.0,
                  ),
                  onPressed: () =>
                      _buildGalleryOptionBottomSheet(context: context),
                )
              ],
              expandedHeight: 250.0,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/temp2.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Color(0xA0000000), BlendMode.multiply)),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Form(
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Text('Designer(s)',
                            style: TextStyle(
                                color: _textColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        Divider(),
                        _buildDesignerTextField(),
                        SizedBox(height: 20.0),
                        Text('Category & Components',
                            style: TextStyle(
                                color: _textColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        Divider(),
                        _buildCategoryTextField(),
                        SizedBox(height: 20.0),
                        _buildComponentsTextField(),
                        SizedBox(height: 20.0),
                        Text('Product Details',
                            style: TextStyle(
                                color: _textColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        Divider(),
                        _buildTitleTextField(context: context),
                        SizedBox(height: 20.0),
                        _buildDescriptionTextField(context: context),
                        SizedBox(height: 20.0),
                        _buildPriceTextField(context: context),
                        SizedBox(height: 20.0),
                        Text('Sizes',
                            style: TextStyle(
                                color: _textColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        Divider(),
                        _buildProductSizes(),
                        SizedBox(height: 20.0),
                        Text('Colors',
                            style: TextStyle(
                                color: _textColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        Divider(),
                        _buildProductColors(),
                        SizedBox(height: 20.0),
                        _buildQTYTextField(),
                        SizedBox(height: 20.0),
                        _buildProductFormControl()
                      ],
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
