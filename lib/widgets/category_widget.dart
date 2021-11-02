import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  final String numberOfProducts;
  final Color backgroundColor;
  final String imgCategory;
  final BuildContext context;
  final double borderRadius;
  final Function onPressed;

  CategoryWidget({
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
      height: Dimensions.pixels_140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Positioned(
                top: Dimensions.pixels_10,
                left: Dimensions.pixels_10,
                child: Text(
                  categoryName,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Positioned(
                child: Text(
                  numberOfProducts,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image(
              image: AssetImage(imgCategory),
            ),
          ),
        ],
      ),
    );
  }
}
