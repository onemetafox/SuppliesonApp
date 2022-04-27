import 'dart:convert';

import 'package:customer_end/models/user_data/user_model.dart';
import 'package:customer_end/views/screens/bottom_navigation_page.dart';
import 'package:customer_end/views/screens/login/login_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckLoginController extends GetxController {
  checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String prefData = prefs.getString("userData");
    if (prefData != null) {
      var response = json.decode(prefData);
      var result =
          UserDataModel.fromJson(json.decode(prefs.getString("userData")));

      // print(result.isLoggedIn);
      if (result.isLoggedIn == null || result.isLoggedIn == false) {
        Get.offAll(() => LoginPage());

      } else {
        Get.offAll(() => HomeBasePage());

      }
    } else {
      Get.offAll(() => LoginPage());

    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(const Duration(milliseconds: 1500), () {
      checkLogin();
    });
  }
}
