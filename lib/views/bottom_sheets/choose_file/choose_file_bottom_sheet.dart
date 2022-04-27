import 'dart:io';

import 'package:customer_end/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChooseFileBottomSheet {
  final picker = ImagePicker();
  File _image;

  void showUploadImageActionSheet(BuildContext context, Function selectedImage,
      {bool isVideo = false,}) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) =>
          CupertinoActionSheet(
            title: Text('Choose Options',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: darkBlue)),
            message: Text('Your options are'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text('Camera'),
                onPressed: () async {
                  Get.back();
                  try {
                    _image = await getImage(true,isVideo);
                    selectedImage(_image);
                  } catch (error) {
                    throw error;
                  }
                },
              ),
              CupertinoActionSheetAction(
                child: Text('Choose from Gallery'),
                onPressed: () async {
                  Get.back();
                  try {
                    _image = await getImage(false,isVideo);
                    selectedImage(_image);
                  } catch (error) {
                    throw error;
                  }
                },
              )
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text('Cancel'),
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context, 'Cancel');
              },
            ),
          ),
    );
  }

  Future<File> getImage(bool isCamera,bool isVideo) async {
    try {
      if(isVideo){
        final pickedFile = await picker.getVideo(
            source: isCamera ? ImageSource.camera : ImageSource.gallery);

        return File(pickedFile.path);
      }
      else {
        final pickedFile = await picker.getImage(
            source: isCamera ? ImageSource.camera : ImageSource.gallery);

        return File(pickedFile.path);
      }
    } catch (error) {
      // print('No Image Selected');
      throw error.toString();
    }
  }
}
