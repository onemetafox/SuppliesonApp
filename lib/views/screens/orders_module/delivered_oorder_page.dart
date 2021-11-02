import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/app_images.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:flutter/material.dart';

class DeliveredOrderPage extends StatelessWidget with BaseClass {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimensions.pixels_16,
          right: Dimensions.pixels_16,
          top: Dimensions.pixels_15,
          bottom: Dimensions.pixels_15),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, int index) {
          return _getNotificationWidget(
              context: context,
              image: groceryImage,
              storeName: "Supply On Store",
              orderNumber: "#2084",
              paymentType: "Cash");
        },
      ),
    );
  }

  Widget _getNotificationWidget(
      {BuildContext context,
        String image,
        String storeName,
        String orderNumber,
        String paymentType}) {
    return Column(
      children: [
        Card(
          elevation: Dimensions.pixels_5,
          child: Padding(
            padding: EdgeInsets.only(
                top: Dimensions.pixels_10, bottom: Dimensions.pixels_10),
            child: ListTile(
              leading: Image(
                image: AssetImage(image),
                height: Dimensions.pixels_50,
                width: Dimensions.pixels_50,
              ),
              title: Text(
                storeName,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: Dimensions.pixels_16,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimensions.pixels_15,
                  ),
                  Text(
                    orderNumber,
                    style: TextStyle(
                        color: hintGrey,
                        fontSize: Dimensions.pixels_14,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: Dimensions.pixels_15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: Dimensions.pixels_10,
                            width: Dimensions.pixels_10,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                BorderRadius.circular(Dimensions.pixels_50)),
                          ),
                          SizedBox(width: Dimensions.pixels_5,),
                          Text(
                            "Delivered",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: Dimensions.pixels_14,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),

                      Text(
                        paymentType,
                        style: TextStyle(
                            color: hintGrey,
                            fontSize: Dimensions.pixels_14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
              isThreeLine: true,
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.pixels_8,
        ),
      ],
    );
  }
}
