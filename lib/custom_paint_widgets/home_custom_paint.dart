import 'package:customer_end/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCustomPaint extends CustomPainter {
   Paint _paint;
   Paint _semiPaint;
   Paint _bluePaint;
   Paint _bluePaintSmall;

  HomeCustomPaint() {
    _paint = Paint()
      ..style = PaintingStyle.fill
      ..color = orange;

    _semiPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25
      ..color = Colors.white;

    _bluePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = skyBlue;
    _bluePaintSmall = Paint()
      ..style = PaintingStyle.fill
      ..color = skyBlue;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(Get.width -100, 100), 72, _paint);
    canvas.drawCircle(Offset(Get.width, 30), 90, _semiPaint);
    canvas.drawCircle(Offset(Get.width -100, 70), 20, _bluePaint);
    canvas.drawCircle(Offset(Get.width -50, 155), 10, _bluePaintSmall);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
