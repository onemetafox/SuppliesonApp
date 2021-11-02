import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/app_images.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:flutter/material.dart';

class BottomNotificationPage extends StatelessWidget {
  final List notificationList = [
    {
      "image": groceryImage,
      "title": " Order 2084 Status has been changed",
    },
    {
      "image": groceryImage,
      "title": " Order 2084 Status has been changed",
    },
    {
      "image": groceryImage,
      "title": " Order 2084 Status has been changed",
    },
    {
      "image": groceryImage,
      "title": " Order 2084 Status has been changed",
    },
    {
      "image": groceryImage,
      "title": " Order 2084 Status has been changed",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Notifications"),
        leading: Container(),
        centerTitle: true,
        shadowColor: orange,
      ),
      body: Container(
        margin: EdgeInsets.only(
            left: Dimensions.pixels_16,
            right: Dimensions.pixels_16,
            top: Dimensions.pixels_15,
            bottom: Dimensions.pixels_15),
        child: ListView.builder(
          itemCount: notificationList.length,
          itemBuilder: (context, int index) {
            return _getNotificationWidget(
                context,
                notificationList.elementAt(index)['image'],
                notificationList.elementAt(index)['title']);
          },
        ),
      ),
    );
  }

  Widget _getNotificationWidget(BuildContext context, String image, String name) {
    return Column(
      children: [
        Card(
          elevation: Dimensions.pixels_5,
          child: Padding(
            padding:  EdgeInsets.only(top: Dimensions.pixels_10,bottom: Dimensions.pixels_10),
            child: ListTile(
              leading: Image(
                image: AssetImage(image),
                height: Dimensions.pixels_50,
                width: Dimensions.pixels_50,
              ),
              title: Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Dimensions.pixels_15,
                    fontWeight: FontWeight.w600),
              ),
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
