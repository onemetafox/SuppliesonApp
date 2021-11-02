
import 'package:animate_do/animate_do.dart';
import 'package:customer_end/controllers/check_login/check_login_controller.dart';
import 'package:customer_end/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  final CheckLoginController checkLoginController =
      Get.put(CheckLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _getAppLogo(),
      ),
    );
  }
}

Widget _getAppLogo() {
  return Bounce(
    child: Container(
      margin: EdgeInsets.only(left: 40, right: 40),
      child: Image(
        image: AssetImage(supplyon_logo),
      ),
    ),
  );
}
