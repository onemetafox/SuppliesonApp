
import 'package:customer_end/utils/size_config.dart';
// import 'package:customer_end/views/screens/login/login_page.dart';
import 'package:customer_end/views/screens/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return GetMaterialApp(

          debugShowCheckedModeBanner: false,
          title: 'Flutter demo',
          //theme: AppTheme.lightTheme,
          home: SplashPage(),
        );
      });
    });
  }
}
