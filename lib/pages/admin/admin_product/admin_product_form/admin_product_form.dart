import 'dart:async';
import 'dart:io';

import 'package:eazy_shop/models/category.dart';
import 'package:eazy_shop/models/product.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_product_form/admin_product_form_bloc.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_product_form/admin_product_form_event.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_product_form/admin_product_form_state.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_product_form/widgets/gallery_option_bottomsheet.dart';
import 'package:eazy_shop/repositories/category/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_media_picker/multi_media_picker.dart';

class AdminProductForm extends StatefulWidget {
  final AdminProductFormBloc productFormBloc;
  final Product product;
  const AdminProductForm(
      {Key key, @required this.productFormBloc, this.product})
      : super(key: key);

  @override
  _AdminProductFormState createState() => _AdminProductFormState();
}

class _AdminProductFormState extends State<AdminProductForm> {
  final Color _textColor = Colors.grey;
  final Color _containerColor1 = Color.fromRGBO(47, 49, 54, 1);
  // final Color _containerColor2 = Color.fromRGBO(54, 57, 63, 1);

  final _formKey = GlobalKey<FormState>();

  final _designerController = TextEditingController();
  final _componentsController = TextEditingController();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _sizesController = TextEditingController();
  final _colorsController = TextEditingController();
  final _quantityController = TextEditingController();

  String _categoryController;
  File _productImage;

  final Map<String, List<String>> _mapString = {
    "[": [''],
    "]": ['']
  };

  CategoryRepository _categoryRepository;
  List<Category> _categories = [];

  @override
  void initState() {
    _categoryRepository = CategoryRepository();

    _categoryRepository.fetchCategories().then((List<Category> categories) {
      setState(() {
        _categories = categories;

        if (widget.product != null) {
          _categoryController = widget.product.category;
        }
      });
    });

    super.initState();
  }

  Future _pickImage({@required ImageSource imageSource}) async {
    var images = await MultiMediaPicker.pickImages(
        source: imageSource, singleImage: true, maxHeight: 350.0);

    setState(() {
      if (images != null) {
        _productImage = images[0];
        print(_productImage);
      }
    });
  }

  Widget _buildProductImage() {
    AssetImage placeholderImage =
        AssetImage('assets/placeholder/placeholder.png');

    if (widget.product != null && _productImage == null) {
      return FadeInImage(
          image: NetworkImage(widget.product.imageUrl),
          placeholder: placeholderImage,
          fit: BoxFit.cover);
    } else {
      return _productImage != null
          ? Image.file(_productImage, fit: BoxFit.cover)
          : Image.asset('assets/placeholder/placeholder.png',
              fit: BoxFit.cover);
    }
  }

  Widget _buildDesignerTextField() {
    if (widget.product != null) {
      _designerController.text = widget.product.designer;
    } else {
      _designerController.text = '';
    }

    return TextFormField(
      style: TextStyle(color: _textColor, fontWeight: FontWeight.bold),
      controller: _designerController,
      decoration: InputDecoration(
          labelText: 'Designed by',
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          filled: true,
          fillColor: _containerColor1),
      validator: (String value) {
        if (_designerController.text.isEmpty) {
          return 'Designer is required';
        }
      },
    );
  }

  Widget _buildCategoryDropDownField() {
    return DropdownButton(
      isExpanded: true,
      hint: Text('Select product category',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold)),
      items: _categories.map((Category category) {
        return DropdownMenuItem(
          value: category.categoryId,
          child: Text(category.title,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold)),
        );
      }).toList(),
      value: _categoryController,
      onChanged: (String value) {
        setState(() {
          _categoryController = value;
        });
      },
    );
  }

  Widget _buildComponentsTextField() {
    if (widget.product != null) {
      _componentsController.text = widget.product.components;
    } else {
      _componentsController.text = '';
    }

    return TextFormField(
      controller: _componentsController,
      style: TextStyle(color: _textColor, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          labelText: 'Product Components [e.g. cotton, silk]',
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          filled: true,
          fillColor: _containerColor1),
      validator: (String value) {
        if (_componentsController.text.isEmpty) {
          return 'Components are required';
        }
      },
    );
  }

  Widget _buildTitleTextField({@required BuildContext context}) {
    if (widget.product != null) {
      _titleController.text = widget.product.title;
    } else {
      _titleController.text = '';
    }

    return TextFormField(
      controller: _titleController,
      style: TextStyle(color: _textColor, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          labelText: 'Title',
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          filled: true,
          fillColor: _containerColor1),
      validator: (String value) {
        if (_titleController.text.isEmpty) {
          return 'Title is required';
        }
      },
    );
  }

  Widget _buildDescriptionTextField({@required BuildContext context}) {
    if (widget.product != null) {
      _descriptionController.text = widget.product.description;
    } else {
      _descriptionController.text = '';
    }

    return TextFormField(
      maxLines: 3,
      keyboardType: TextInputType.multiline,
      controller: _descriptionController,
      style: TextStyle(color: _textColor, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          labelText: 'Description',
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          filled: true,
          fillColor: _containerColor1),
      validator: (String value) {
        if (_descriptionController.text.isEmpty) {
          return 'Description is required';
        }
      },
    );
  }

  Widget _buildPriceTextField({@required BuildContext context}) {
    if (widget.product != null) {
      _priceController.text = widget.product.price.toString();
    } else {
      _priceController.text = '';
    }

    return TextFormField(
      keyboardType: TextInputType.number,
      controller: _priceController,
      style: TextStyle(color: _textColor, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          labelText: 'Price',
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          filled: true,
          fillColor: _containerColor1),
      validator: (String value) {
        if (_priceController.text.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$')
                .hasMatch(_priceController.text)) {
          return 'Designer is required';
        }
      },
    );
  }

  Widget _buildQTYTextField() {
    if (widget.product != null) {
      _quantityController.text = widget.product.quantity.toString();
    } else {
      _quantityController.text = '';
    }

    return TextFormField(
      keyboardType: TextInputType.number,
      controller: _quantityController,
      style: TextStyle(color: _textColor, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          labelText: 'Available QTY',
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          filled: true,
          fillColor: _containerColor1),
      validator: (String value) {
        if (_quantityController.text.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\d+)?$')
                .hasMatch(_quantityController.text)) {
          return 'Quantity is required';
        }
      },
    );
  }

  Widget _buildProductSizes() {
    if (widget.product != null) {
      String sizeString = widget.product.sizes.toString();

      _mapString.forEach((key, mapping) {
        sizeString = sizeString.replaceFirst(key, mapping[0]);
        sizeString = sizeString.replaceFirst(key, mapping[0]);
      });

      _sizesController.text = sizeString;
    } else {
      _sizesController.text = '';
    }

    return TextFormField(
      controller: _sizesController,
      style: TextStyle(color: _textColor, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          labelText: 'Product Sizes',
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          hintText: 'Enter product sizes [e.g. Large, Xtra-Large.]',
          hintStyle:
              TextStyle(color: _containerColor1, fontWeight: FontWeight.bold),
          filled: true,
          fillColor: _containerColor1),
      validator: (String value) {
        if (_sizesController.text.isEmpty) {
          return 'Sizes are required';
        }
      },
    );
  }

  Widget _buildProductColors() {
    if (widget.product != null) {
      String colorString = widget.product.colors.toString();

      _mapString.forEach((key, mapping) {
        colorString = colorString.replaceFirst(key, mapping[0]);
        colorString = colorString.replaceFirst(key, mapping[0]);
      });

      _colorsController.text = colorString;
    } else {
      _colorsController.text = '';
    }

    return TextFormField(
      controller: _colorsController,
      style: TextStyle(color: _textColor, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          labelText: 'Product Colors',
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          hintText: 'Enter product colors [e.g. Red, Blue.]',
          hintStyle: TextStyle(color: _textColor, fontWeight: FontWeight.bold),
          filled: true,
          fillColor: _containerColor1),
      validator: (String value) {
        if (_colorsController.text.isEmpty) {
          return 'Colors are required';
        }
      },
    );
  }

  Widget _buildProductFormControl({@required AdminProductFormState state}) {
    return InkWell(
      onTap: state.isSaveProductButtonEnabled ? _submitForm : null,
      child: Container(
        height: 50.0,
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        alignment: Alignment.center,
        child: state.isLoading
            ? CircularProgressIndicator()
            : Text(
                widget.product != null ? 'Update' : 'Save',
                style: TextStyle(
                    color: _textColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900),
              ),
      ),
    );
  }

  void _buildValidationSnackBar({@required String message, Function action}) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('$message',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).backgroundColor,
        action: action != null
            ? SnackBarAction(
                label: 'Select Image',
                onPressed: action,
              )
            : null,
      ),
    );
  }

  void _submitForm() {
    FocusScope.of(context).requestFocus(FocusNode());

    final galleryBottomsheet =
        GalleryOptionBottomsheet(context: context, pickImage: _pickImage);

    if (!_formKey.currentState.validate()) {
      return;
    }

    if (_categoryController == null) {
      _buildValidationSnackBar(message: 'Select product category!');
      return;
    }

    List<String> _productSizes = _sizesController.text.trim().split(',');
    List<String> _productColors = _colorsController.text.trim().split(',');

    _formKey.currentState.save();

    if (widget.product != null) {
      widget.productFormBloc.onUpdateProduct(
          productId: widget.product.productId,
          designer: _designerController.text,
          category: _categoryController,
          components: _componentsController.text,
          title: _titleController.text,
          description: _descriptionController.text,
          price: double.parse(_priceController.text),
          sizes: _productSizes,
          colors: _productColors,
          quantity: int.parse(_quantityController.text),
          image: _productImage != null ? _productImage : null);
    } else {
      if (_productImage == null) {
        _buildValidationSnackBar(
            message: 'Select product image!',
            action: galleryBottomsheet.openGalleryOptionBottomSheet);
        return;
      }

      widget.productFormBloc.onCreateProduct(
          designer: _designerController.text,
          category: _categoryController,
          components: _componentsController.text,
          title: _titleController.text,
          description: _descriptionController.text,
          price: double.parse(_priceController.text),
          sizes: _productSizes,
          colors: _productColors,
          quantity: int.parse(_quantityController.text),
          image: _productImage);
    }
  }

  void _resetForm() {
    _designerController.text = '';
    _categoryController = null;
    _componentsController.text = '';
    _titleController.text = '';
    _descriptionController.text = '';
    _priceController.text = '';
    _sizesController.text = '';
    _colorsController.text = '';
    _quantityController.text = '';
    _productImage = null;
  }

  Widget _buildSliverAppBar() {
    final galleryBottomsheet =
        GalleryOptionBottomsheet(context: context, pickImage: _pickImage);

    return SliverAppBar(
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
          onPressed: galleryBottomsheet.openGalleryOptionBottomSheet,
        )
      ],
      expandedHeight: 250.0,
      flexibleSpace: _buildProductImage(),
      // flexibleSpace: FlexibleSpaceBar(background: _buildImageContainer()),
    );
  }

  Widget _buildSliverList({@required AdminProductFormState state}) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Form(
          key: _formKey,
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
                _buildCategoryDropDownField(),
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
                Text('Quantity',
                    style: TextStyle(
                        color: _textColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                Divider(),
                _buildQTYTextField(),
                SizedBox(height: 20.0),
                _buildProductFormControl(state: state)
              ],
            ),
          ),
        )
      ]),
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  void _navigateToProducts() {
    _onWidgetDidBuild(() {
      Navigator.of(context).pop();
    });
  }

  bool _productSaveSuccess(AdminProductFormState state) =>
      state.productId.isNotEmpty;
  bool _productSaveFailure(AdminProductFormState state) =>
      state.error.isNotEmpty;

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
    return BlocBuilder<AdminProductFormEvent, AdminProductFormState>(
      bloc: widget.productFormBloc,
      builder: (BuildContext context, AdminProductFormState state) {
        if (_productSaveSuccess(state)) {
          widget.productFormBloc.onCreatedProduct();
          _feedbackSnackbar(message: {
            'success': true,
            'details': 'Product successfully saved.'
          });

          // reset form
          _resetForm();

          if (widget.product != null) {
            _navigateToProducts();
          }

          if (widget.product == null) {
            // reset form
            _formKey.currentState.reset();
            _productImage = null;
          }
        }

        if (_productSaveFailure(state)) {
          _feedbackSnackbar(
              message: {'success': false, 'details': '${state.error}.'});
          print('state error ${state.error}');
          widget.productFormBloc.onCreatedProduct();
        }

        return CustomScrollView(
          slivers: <Widget>[
            _buildSliverAppBar(),
            _buildSliverList(state: state),
          ],
        );
      },
    );
  }
}
