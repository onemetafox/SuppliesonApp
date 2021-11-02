import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:flutter/material.dart';

class OfferWidget extends StatelessWidget {
  final String offerName;
  final String offerImage;
  final Color offerBackgroundColor;

  OfferWidget({
    this.offerName,
    this.offerImage,
    this.offerBackgroundColor = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.pixels_120,
      width: Dimensions.pixels_200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.pixels_8),
        color: offerBackgroundColor,
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: Dimensions.pixels_5),
              child: Image(
                image: AssetImage(offerImage),
                height: Dimensions.pixels_67,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: Dimensions.pixels_10),
              child: Text(
                offerName,
                style:
                    TextStyle(color: Colors.white, fontSize: Dimensions.pixels_14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
