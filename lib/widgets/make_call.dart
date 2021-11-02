import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MakeCall extends StatelessWidget {
  final Widget child;
  final String number;

  MakeCall({@required this.child, @required this.number});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await launch('tel:$number');
      },
      child: child,
    );
  }
}
