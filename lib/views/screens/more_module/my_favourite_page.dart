import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/app_images.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:flutter/material.dart';

class MyFavouritePage extends StatelessWidget {
  final List myFavList = [
    {
      "image": groceryImage,
      "name": "Vision Company LLc",
    },
    {
      "image": groceryImage,
      "name": "Orbision pvt limited",
    },
    {
      "image": groceryImage,
      "name": "SuppliesOn Company LLC",
    },
    {
      "image": groceryImage,
      "name": "Google Grocery",
    },
    {
      "image": groceryImage,
      "name": "City mart LLC",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        shadowColor: orange,
        title: Text(
          "Favourite",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
            left: Dimensions.pixels_16,
            right: Dimensions.pixels_16,
            top: Dimensions.pixels_15,
            bottom: Dimensions.pixels_15),
        child: ListView.builder(
          itemCount: myFavList.length,
          itemBuilder: (context, int index) {
            return _getFavouriteWidget(
                context,
                myFavList.elementAt(index)['image'],
                myFavList.elementAt(index)['name']);
          },
        ),
      ),
    );
  }

  Widget _getFavouriteWidget(BuildContext context, String image, String name) {
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
              trailing: Icon(
                Icons.delete,
                size: Dimensions.pixels_25,
                color: Colors.red,
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
