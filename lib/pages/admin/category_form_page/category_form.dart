import 'dart:async';
import 'dart:io';

// import 'package:multiple_image_picker/multiple_image_picker.dart';
// import 'package:adv_image_picker/adv_image_picker.dart';
import 'package:multi_media_picker/multi_media_picker.dart';

import 'package:eazy_shop/pages/admin/category_form_page/category_form_bloc.dart';
import 'package:eazy_shop/pages/admin/category_form_page/category_form_event.dart';
import 'package:eazy_shop/pages/admin/category_form_page/category_form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

class CategoryForm extends StatefulWidget {
  final CategoryFormBloc categoryFormBloc;

  const CategoryForm({Key key, @required this.categoryFormBloc})
      : super(key: key);

  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  final Color _textColor = Colors.grey;

  File _categoryImage;
  Map<String, dynamic> _formData = {'title': null, 'description': null};

  final Color _containerColor1 = Color.fromRGBO(47, 49, 54, 1);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future _pickImage({@required ImageSource imageSource}) async {
    var images = await MultiMediaPicker.pickImages(
        source: imageSource, singleImage: true, maxHeight: 350.0);

    setState(() {
      if (images != null) {
        _categoryImage = images[0];
        print(_categoryImage);
      }
    });
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
                InkWell(
                  onTap: () async {
                    Navigator.of(context).pop();
                    await _pickImage(imageSource: ImageSource.camera);
                  },
                  child: Row(
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
                ),
                SizedBox(height: 20.0),
                InkWell(
                  onTap: () async {
                    Navigator.of(context).pop();
                    await _pickImage(imageSource: ImageSource.gallery);
                  },
                  child: Row(
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
                ),
              ],
            ),
          );
        });
  }

  Widget _buildPickImageButton() {
    return IconButton(
      icon: Icon(
        Icons.add_a_photo,
        color: Theme.of(context).primaryColor,
        size: 30.0,
      ),
      onPressed: () {
        print('addPhoto');
        _buildGalleryOptionBottomSheet(context: context);
      },
    );
  }

  Widget _buildImageContainer() {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: _categoryImage != null
              ? FileImage(_categoryImage)
              : AssetImage('assets/images/temp1.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Color(0xA0000000), BlendMode.multiply),
        ),
      ),
    );
  }

  // Widget _buildImageHeaderStack() {
  //   return Stack(
  //     children: <Widget>[
  //       Container(height: 200.0, width: 350.0),
  //       _buildImageContainer(),
  //     ],
  //   );
  // }

  Widget _buildTitleTextField({@required TextStyle textStyle}) {
    return TextFormField(
      style: textStyle,
      decoration: InputDecoration(
          labelText: 'Category Title',
          labelStyle: textStyle,
          filled: true,
          fillColor: _containerColor1),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Category title is required!';
        }
      },
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }

  Widget _buildDescriptionTextField({@required TextStyle textStyle}) {
    return TextFormField(
      maxLines: 3,
      keyboardType: TextInputType.multiline,
      style: textStyle,
      decoration: InputDecoration(
          labelText: 'Category Description',
          labelStyle: textStyle,
          filled: true,
          fillColor: _containerColor1),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Category description is required!';
        }
      },
      onSaved: (String value) {
        _formData['description'] = value;
      },
    );
  }

  Widget _buildCategoryFormControl({@required CategoryFormState state}) {
    return InkWell(
      onTap: state.isSaveButtonEnabled ? _submitForm : null,
      child: Container(
        height: 50.0,
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        alignment: Alignment.center,
        child: state.isLoading
            ? CircularProgressIndicator()
            : Text(
                'Save',
                style: TextStyle(
                    color: _containerColor1,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
      ),
    );
  }

  void _submitForm() {
    FocusScope.of(context).requestFocus(FocusNode());

    if (_categoryImage == null) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'No image selected! Select category image.',
            style: TextStyle(color: Colors.red),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          action: SnackBarAction(
            label: 'Select Image',
            onPressed: () => _buildGalleryOptionBottomSheet(context: context),
          ),
        ),
      );
      return;
    }

    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    widget.categoryFormBloc.onCreateCategory(
      title: _formData['title'],
      description: _formData['description'],
      image: _categoryImage,
    );
  }

  Widget _buildForm({@required CategoryFormState state}) {
    TextStyle _textStyle = TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 18.0,
        fontWeight: FontWeight.bold);

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            // automaticallyImplyLeading: false,
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back, color: _textColor),
            //   onPressed: () => Navigator.of(context).pop,
            // ),
            actions: <Widget>[_buildPickImageButton()],
            expandedHeight: 350.0,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildImageContainer(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          _buildTitleTextField(textStyle: _textStyle),
                          SizedBox(height: 20.0),
                          _buildDescriptionTextField(textStyle: _textStyle),
                          SizedBox(height: 20.0),
                          _buildCategoryFormControl(state: state)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  bool _categorySaveSuccess(CategoryFormState state) =>
      state.categoryId.isNotEmpty;
  bool _categorySaveFailure(CategoryFormState state) => state.error.isNotEmpty;

  void _feedbackSnackbar({@required Map<String, dynamic> message}) {
    return _onWidgetDidBuild(() {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: message['success']
              ? Text('${message['details']}')
              : Text(
                  'Oops ${message['details']}',
                  style: TextStyle(color: Colors.red),
                ),
          backgroundColor: Theme.of(context).backgroundColor,
          action: message['success']
              ? null
              : SnackBarAction(
                  label: 'Retry',
                  onPressed: _submitForm,
                ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryFormEvent, CategoryFormState>(
      bloc: widget.categoryFormBloc,
      builder: (BuildContext context, CategoryFormState state) {
        if (_categorySaveSuccess(state)) {
          widget.categoryFormBloc.onCreatedCategory();
          _feedbackSnackbar(message: {
            'success': true,
            'details': 'Category successfully saved.'
          });

          // reset form
          _formKey.currentState.reset();
          _categoryImage = null;
        }

        if (_categorySaveFailure(state)) {
          _feedbackSnackbar(
              message: {'success': false, 'details': '${state.error}.'});
          print('state error ${state.error}');
          widget.categoryFormBloc.onCreatedCategory();
        }

        return _buildForm(state: state);
      },
    );
  }
}