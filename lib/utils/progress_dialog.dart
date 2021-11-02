
import 'package:customer_end/utils/app_colors.dart';
import 'package:flutter/material.dart';



class ProgressDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Container(
            padding: EdgeInsets.all(10),
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                orange,
              ),
            ),),
      ),
    );
  }
}
