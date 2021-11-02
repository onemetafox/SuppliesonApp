import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectorWidget extends StatelessWidget {
  final String categoryName;
  final String numberOfProducts;
  final Color backgroundColor;
  final String imgCategory;
  final BuildContext context;
  final double borderRadius;
  final Function onPressed;

  SectorWidget({
    this.categoryName,
    this.numberOfProducts,
    this.backgroundColor,
    this.context,
    this.borderRadius = 12,
    this.onPressed,
    this.imgCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: backgroundColor,
        border: Border.all(color: darkBlue, width: 2),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$categoryName",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                color: darkBlue, fontSize: Dimensions.pixels_20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "$numberOfProducts",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                color: orange, fontSize: Dimensions.pixels_14),
          ),
          /* Positioned(
            top: Dimensions.pixels_10,
            left: Dimensions.pixels_10,
            child: Text(
              "$categoryName\n$numberOfProducts",
              style: TextStyle(color: Colors.white,fontSize: Dimensions.pixels_20),
            ),
          ),*/
          /* Positioned(
            bottom: Dimensions.pixels_5,
            right: Dimensions.pixels_5,
            child: Image(
              image: AssetImage(imgCategory),
              height: Dimensions.pixels_60,
            ),
          ),*/
        ],
      ),
    );
  }
}
