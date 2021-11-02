import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:flutter/material.dart';

class MoreOptionWidget extends StatelessWidget {
  final String title;

  final Widget leadingIcon;
  final Widget trailingIcon;

  final Color titleColor;

  final Function onClicked;

  final int index;
  final BuildContext buildContext;

  MoreOptionWidget({
    @required this.title,
    @required this.leadingIcon,
    @required this.trailingIcon,
    @required this.titleColor,
    this.index,
    this.onClicked,
    this.buildContext,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onClicked(index, buildContext);
      },
      child: Container(
        margin: EdgeInsets.only(
            top: Dimensions.pixels_5, bottom: Dimensions.pixels_5),
        height: Dimensions.pixels_40,
        child: Row(
          children: [
            leadingIcon,
            SizedBox(
              width: Dimensions.pixels_12,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: titleColor,
                ),
              ),
            ),
            trailingIcon,
          ],
        ),
      ),
    );
  }
}
