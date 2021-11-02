import 'dart:convert';
import 'dart:io';

import 'package:customer_end/utils/progress_dialog.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
mixin BaseClass {
  final String _securityKey = "track@0#-129";

  // Makes a screen to potrait only
  // implement in main class to make the whole app in potrait mode
  void portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  // returns the width of the screen
  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  //returns the height of the screen
  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // open next screen written in destination and keeps the previous screen in stack
  void pushToNextScreen(
      {@required BuildContext context, @required Widget destination}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  void popToPreviousScreen({@required BuildContext context}) {
    Navigator.pop(context);
  }

  void popToPreviousAndReturnData({@required BuildContext context}) {
    Navigator.pop(context, true);
  }

  //replaces the current screen with the destination and clears previous stack
  void pushAndReplace(
      {@required BuildContext context, @required Widget destination}) {
    //Navigator.of(context).pop();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => destination));
  }

  void pushToNextScreenLikeIOS(
      {@required BuildContext context, @required Widget destination}) {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => destination));
  }

  void pushToNextScreenWithAnimation(
      {@required BuildContext context, @required Widget destination}) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => destination,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: child,
        ),
        /*transitionDuration: Duration(milliseconds: 2000),*/
      ),
    );
  }

  void pushToNextScreenWithFadeAnimation(
      {@required BuildContext context, @required Widget destination,int duration =500}) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => destination,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: Duration(milliseconds: duration),
      ),
    );
  }

  void pushReplaceAndClearStack(
      {@required BuildContext context, @required Widget destination}) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => destination),
        (Route<dynamic> route) => false);
  }



  Map<String, String> getSecurityKeyHeader() {
    var map = new Map<String, String>();
    map["security_key"] = _securityKey;
    return map;
  }

  void fieldFocusChange(
      {BuildContext context, FocusNode currentFocus, FocusNode nextFocus}) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  String removeString({@required String value}) {
    String result = value.replaceAll("Exception: ", "");
    return result;
  }

  void removeFocusFromEditText({@required BuildContext context}) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

/*  void showSuccessOverLay(String message) {
    showSimpleNotification(
      Center(child: Text(message)),
      background: Colors.green,
    );
  }

  void showErrorOverLay(String message) {
    showSimpleNotification(Center(child: Text(message)),
        background: Colors.redAccent);
  }*/

/*  String getDateTime(int timestamp) {
    if (timestamp == null) return "";

    var date =
    DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: false);
    String formattedTime = DateFormat('Hm').format(date);
    String formattedDate = DateFormat.MMMd().format(date);
    return (formattedDate + " , " + formattedTime);
  }*/

  String getDeviceType() {
    if (Platform.isAndroid) {
      return "android";
    } else {
      return "ios";
    }
  }
  void showError({
    @required String title,
    @required String message,
  }) {
    Get.snackbar(title, message,
        colorText: Colors.black,
        backgroundColor: Colors.red,
        duration: Duration(milliseconds: 1500));
  }

  void showSuccess({
    @required String title,
    @required String message,
  }) {
    Get.snackbar(title, message,
        colorText: Colors.black,
        backgroundColor: Colors.green,
        duration: Duration(milliseconds: 1500));
  }
/*  String getDateTime(int timestamp) {
    if (timestamp == null) return "";

    var date =
        DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: false);
    String formattedTime = DateFormat('Hm').format(date);
    String formattedDate = DateFormat('MMMM dd, yyyy').format(date);
    return (formattedDate + " " + formattedTime);
  }

  Future<bool> isInternetConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (!(connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi)) {
      return false;
    } else {
      return true;
    }
  }*/

/*
  void showError(BuildContext context,String message){
    showToast(message,
        context: context,
        animation: StyledToastAnimation.slideFromTop,
        reverseAnimation: StyledToastAnimation.slideToTop,
        position: StyledToastPosition.top,
        toastHorizontalMargin: Dimensions.pixels_5,
        fullWidth: true,
        isHideKeyboard: false,
        isIgnoring: true,
        backgroundColor: Colors.red,
        startOffset: Offset(0.0, -3.0),
        reverseEndOffset: Offset(0.0, -3.0),
        duration: Duration(seconds: 4),
        //Animation duration   animDuration * 2 <= duration
        animDuration: Duration(seconds: 1),
        curve: Curves.elasticOut,
        reverseCurve: Curves.fastOutSlowIn);
  }
*/

  Map<String, dynamic> getResponseMap(String response) {
    return json.decode(response);
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      content: Builder(
        builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.
          return Container(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                Colors.red,
              ),
            ),
          );
        },
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void showLoader(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(15),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 10,
                ),
                Text("Please Wait"),
              ],
            ),
          ),
        );
      },
    );
  }

  void showCircularDialog(BuildContext context) {
    showDialog(

      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => ProgressDialog(),
    );
  }
  Future<bool> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      print('not connected');
      //Here you can setState a bool like internetAvailable = false;
      //or use call this before uploading data to firestore/storage depending upon the result, you can move on further.
      return false;
    }
  }
  BoxDecoration getScreenBackgroundDecoration({Color color = Colors.white}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Dimensions.pixels_30),
        topRight: Radius.circular(Dimensions.pixels_30),
      ),
    );
  }
  Widget getCustomAppBar(BuildContext context,
      {double topMargin = 0, Color iconColor = Colors.white,Function onBackClick}) {
    return Container(
      width: double.infinity,
      height: Dimensions.pixels_56,
      margin: EdgeInsets.only(left: Dimensions.pixels_20, top: topMargin),
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          if(onBackClick!=null){
            onBackClick();
          }
          else {
            Navigator.pop(context);
          }
        },
        child: Padding(
          padding: EdgeInsets.all(Dimensions.pixels_8),
          child: Icon(
            Icons.arrow_back_ios,
            size: Dimensions.pixels_20,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
