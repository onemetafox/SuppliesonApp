import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:flutter/material.dart';

class RoundedIcon extends StatelessWidget {
  final Icon icon;
  final Color color;
  RoundedIcon({@required this.icon, this.color = const Color(0xffCE4C3C)});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: icon,
      padding: EdgeInsets.all(Dimensions.pixels_8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Dimensions.pixels_50),
      ),
    );
  }
}
