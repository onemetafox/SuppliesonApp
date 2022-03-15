import 'package:customer_end/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class ShareOnFeedDialog {
  static void shareOnFeedDialog(BuildContext context,
      {String title = 'Share',
      String subTitle = "Do you want to share this challenge on the feed",
      @required Function onCancel,
      @required Function onYes}) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 300),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            height: 170,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            decoration: TextDecoration.none,
                            fontSize: 18,
                            color: Colors.red),
                      ),
                      SizedBox(height: 5,),
                      new Text(
                        subTitle,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            decoration: TextDecoration.none,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          Get.back();
                          onYes();
                        },
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: darkBlue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Share on my feed',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                  decoration: TextDecoration.none,
                                  fontSize: 14,

                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                      onCancel();
                    },
                    child: Container(
                      child: Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            margin: EdgeInsets.only(left: 50, right: 50),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
/*showDialog(
      context: context,
      builder: (BuildContext context) =>
      CupertinoAlertDialog(
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
      ),
    );*/
}
