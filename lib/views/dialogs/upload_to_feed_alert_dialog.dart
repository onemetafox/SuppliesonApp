import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadToFeedAlertDialog {
  static void uploadToFeedConfirmationDialog(BuildContext context,
      {String title = 'Upload to feed',
        String subTitle = "You want to exit without uploading challenge result to feed? ",
        @required Function onCancel,
        @required Function onYes}) {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: new Text(title),
          content: new Text(
            subTitle,
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Get.back();
                onCancel();
              },
              child: Text(
                'No',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Get.back();
                onYes();
              },
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ));
  }
}
