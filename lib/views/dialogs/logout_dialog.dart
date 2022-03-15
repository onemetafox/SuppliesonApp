import 'package:customer_end/views/screens/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LogoutDialog {
 static void logoutDialog(BuildContext context,
      {String title = 'Logout',
      String subTitle = "Are you sure to log out of this account?"}) {
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
                  onPressed: (){
                    Get.back();
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                CupertinoDialogAction(
                  onPressed: (){
                    Get.back();
                    Get.offAll(LoginPage());
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
