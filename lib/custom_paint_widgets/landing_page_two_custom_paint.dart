import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPageTwoCustomPaint extends CustomPainter {
   Paint _paint;
   Paint _semiPaint;
   Paint _bluePaint;
   Paint _bluePaintSmall;
   Paint _topLeftPaint;

   Paint _bottomRightPaint;

  LandingPageTwoCustomPaint() {
    _topLeftPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = primaryColor;
    _paint = Paint()
      ..style = PaintingStyle.fill
      ..color = primaryColor;

    _semiPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = Dimensions.pixels_25
      ..color = Colors.white;

    _bluePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = darkBlue;
    _bluePaintSmall = Paint()
      ..style = PaintingStyle.fill
      ..color = darkBlue;
    _bottomRightPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = primaryColor;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(0, 0), Dimensions.pixels_100, _topLeftPaint);
    canvas.drawCircle(
        Offset(Get.width - Dimensions.pixels_100, Dimensions.pixels_80),
        Dimensions.pixels_100,
        _paint);
    canvas.drawCircle(Offset(Get.width, Dimensions.pixels_40),
        Dimensions.pixels_90, _semiPaint);
    canvas.drawCircle(
        Offset(Get.width - Dimensions.pixels_100, Dimensions.pixels_70),
        Dimensions.pixels_20,
        _bluePaint);
    canvas.drawCircle(
        Offset(Get.width - Dimensions.pixels_50,
            Dimensions.pixels_150 - Dimensions.pixels_25),
        Dimensions.pixels_10,
        _bluePaintSmall);
    canvas.drawCircle(
        Offset(Get.width - Dimensions.pixels_25, Get.height * 0.75),
        Dimensions.pixels_120,
        _bottomRightPaint);
    canvas.drawCircle(
        Offset(Get.width *0.73, Get.height * 0.85),
        Dimensions.pixels_40,
        _semiPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
