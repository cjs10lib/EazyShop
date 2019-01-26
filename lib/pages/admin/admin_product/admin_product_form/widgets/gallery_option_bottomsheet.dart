import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_media_picker/multi_media_picker.dart';

class GalleryOptionBottomsheet {
  final BuildContext context;
  final Color _textColor = Colors.grey;
  final Function pickImage;

  GalleryOptionBottomsheet({@required this.context, @required this.pickImage});

  Future openGalleryOptionBottomSheet() {
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
                  onTap: () {
                    Navigator.of(context).pop();
                    pickImage(imageSource: ImageSource.camera);
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
                  onTap: () {
                    Navigator.of(context).pop();
                    pickImage(imageSource: ImageSource.gallery);
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
}
