import 'package:customer_end/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterCustomPaint extends CustomPainter  {
   Paint _paint;
   Paint _semiPaint;

   Paint _rightBottomEndPaint;

  RegisterCustomPaint() {
    _paint = Paint()
      ..style = PaintingStyle.fill
      ..color = orange;

    _semiPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15
      ..color = Colors.white;

    _rightBottomEndPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = orange;
  }

  @override
  void paint(Canvas canvas, Size size) {

    canvas.drawCircle(Offset(Get.width-50, 20), 60, _paint);
    canvas.drawCircle(Offset(Get.width, 0), 40, _semiPaint);
    canvas.drawCircle(Offset(0, Get.height * 0.08), 30, _rightBottomEndPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
