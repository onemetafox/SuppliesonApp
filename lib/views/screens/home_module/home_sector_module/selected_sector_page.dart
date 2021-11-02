
import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/app_images.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:flutter/material.dart';

import '../offer_details_page.dart';

class SelectedSectorPage extends StatefulWidget {
  @override
  _SelectedSectorPageState createState() => _SelectedSectorPageState();
}

class _SelectedSectorPageState extends State<SelectedSectorPage>
    with BaseClass {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vegetables & Fruits",
          style: TextStyle(fontSize: Dimensions.pixels_16),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(
              left: Dimensions.pixels_16,
              right: Dimensions.pixels_16,
              top: Dimensions.pixels_10,
              bottom: Dimensions.pixels_10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: Dimensions.pixels_18),
                  ),
                  Text(
                    "See more",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: Dimensions.pixels_18),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.pixels_15,
              ),
              Container(
                height: Dimensions.pixels_120,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, int index) {
                      return Container(
                        height: Dimensions.pixels_80,
                        width: Dimensions.pixels_120,
                        margin: EdgeInsets.only(right: Dimensions.pixels_8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(Dimensions.pixels_8),
                            border: Border.all(color: primaryColor)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(groceryImage),
                              height: Dimensions.pixels_40,
                              width: Dimensions.pixels_40,
                            ),
                            SizedBox(
                              height: Dimensions.pixels_10,
                            ),
                            Text(
                              "Tomato",
                              style: TextStyle(color: primaryColor),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: Dimensions.pixels_15,
              ),
              Text(
                "Top Promotion Suppliers",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.pixels_18),
              ),
              SizedBox(
                height: Dimensions.pixels_15,
              ),
              Container(
                height: Dimensions.pixels_180,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, int index) {
                      return GestureDetector(
                        onTap: () {
                          pushToNextScreenWithAnimation(
                              context: context,
                              destination: OfferDetailsPage());
                        },
                        child: Container(
                          height: Dimensions.pixels_10,
                          width: Dimensions.pixels_160,
                          margin: EdgeInsets.only(right: Dimensions.pixels_8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.pixels_8),
                              border: Border.all(color: orange)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(groceryImage),
                                height: Dimensions.pixels_40,
                                width: Dimensions.pixels_40,
                              ),
                              SizedBox(
                                height: Dimensions.pixels_10,
                              ),
                              Text(
                                "Supplier ${index}",
                                style: TextStyle(color: primaryColor),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              /*SizedBox(
                height: Dimensions.pixels_15,
              ),
              Text(
                "Offers",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.pixels_18),
              ),
              SizedBox(
                height: Dimensions.pixels_10,
              ),
              Container(
                height: Dimensions.pixels_128,
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        pushToNextScreenWithAnimation(
                            context: context, destination: OfferDetailsPage());
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          right: Dimensions.pixels_5,
                        ),
                        child: OfferWidget(
                          offerName: "Offer $index",
                          offerBackgroundColor: primaryColor,
                          offerImage: groceryImage,
                        ),
                      ),
                    );
                  },
                ),
              ),*/
              SizedBox(
                height: Dimensions.pixels_15,
              ),
              Text(
                "All Suppliers",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.pixels_18),
              ),
              SizedBox(
                height: Dimensions.pixels_10,
              ),
              ListView.builder(
                  itemCount: 7,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      onTap: () {
                        pushToNextScreenWithAnimation(
                            context: context, destination: OfferDetailsPage());
                      },
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: Dimensions.pixels_200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.pixels_12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.05),
                                      blurRadius: 8.0,
                                      offset: Offset(0.0, 1),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(groceryImage),
                                      height: Dimensions.pixels_40,
                                      width: Dimensions.pixels_40,
                                    ),
                                    SizedBox(
                                      height: Dimensions.pixels_10,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      right: Dimensions.pixels_20,
                                      top: Dimensions.pixels_10),
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: orange,
                                    size: Dimensions.pixels_25,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                    padding: EdgeInsets.only(
                                        left: Dimensions.pixels_16,
                                        right: Dimensions.pixels_16,
                                        bottom: Dimensions.pixels_8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Title",
                                          style: TextStyle(color: primaryColor),
                                        ),
                                        SizedBox(
                                          height: Dimensions.pixels_10,
                                        ),
                                        Text(
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                                          style: TextStyle(color: primaryColor),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.pixels_10,
                          )
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
