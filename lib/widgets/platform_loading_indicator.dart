import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformLoadingIndicator extends StatelessWidget {
  final double radius, strokeWidth;

  PlatformLoadingIndicator({
    this.radius = 15,
    this.strokeWidth = 4,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoActivityIndicator(radius: radius);
    } else {
      return CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: strokeWidth,
      );
    }
  }
}
