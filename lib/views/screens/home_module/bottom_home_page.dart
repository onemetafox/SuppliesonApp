import 'dart:ui';
import 'package:customer_end/controllers/user_data/get_shared_pref.dart';
import 'package:customer_end/custom_paint_widgets/home_custom_paint.dart';
import 'package:customer_end/models/user_data/user_model.dart';

import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/app_images.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:customer_end/views/screens/suppliers/suppliers_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_widgets/sector_widget.dart';

class BottomHomePage extends StatelessWidget with BaseClass {
  final GetSharedPref getSharedPref = Get.isRegistered<GetSharedPref>()
      ? Get.find<GetSharedPref>()
      : Get.put(GetSharedPref());
  void getUserModel() async{
   var  userDataModel = await getSharedPref.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: Get.height * 0.5,
            color: darkBlue,
          ),
          CustomPaint(
            painter: HomeCustomPaint(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.pixels_21,
                    top: Dimensions.pixels_70,
                  ),
                  child: Text(
                    "Hello ${getSharedPref.userDataModel.firstName}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.pixels_22,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.only(left: Dimensions.pixels_21),
                  child: Text(
                    "Welcome to SuppliesOn",
                    style: TextStyle(
                        color: Colors.white, fontSize: Dimensions.pixels_16),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: Get.height * 0.3),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24))),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*  SizedBox(
                        height: Dimensions.pixels_10,
                      ),
                      _getLabel("Offers"),
                      SizedBox(
                        height: Dimensions.pixels_10,
                      ),
                      Container(
                        height: Dimensions.pixels_128,
                        child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                pushToNextScreenWithAnimation(
                                    context: context,
                                    destination: OfferDetailsPage());
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: Dimensions.pixels_5,
                                    left: Dimensions.pixels_5),
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
                    height: Dimensions.pixels_10,
                  ),
                  Container(
                    child: _getLabel("Categories"),
                    margin: EdgeInsets.only(top: 30, left: 20),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      itemCount: 20,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int position) {
                        print(((getScreenWidth(context) / 2) /
                            ((getScreenHeight(context) -
                                    kToolbarHeight -
                                    Dimensions.pixels_24) /
                                2)));
                        return GestureDetector(
                          onTap: () {
                            pushToNextScreenWithAnimation(context: context, destination: SuppliersListPage());
                            /*pushToNextScreenWithAnimation(
                              context: context,
                              destination: SubCategoryPage(),
                            );*/
                            //   Get.to(()=>SubCategoryPage());
                            /*   pushToNextScreenWithAnimation(
                                    context: context,
                                    destination: SelectedSectorPage());*/
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                top: Dimensions.pixels_15,
                                left: Dimensions.pixels_5,
                                right: Dimensions.pixels_5),
                            child: SectorWidget(
                              categoryName: "Bakery",
                              numberOfProducts: "100 products",
                              context: context,
                              imgCategory: groceryImage,
                              backgroundColor: primaryColor,
                              borderRadius: Dimensions.pixels_12,
                            ),
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 1.3),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getLabel(String labelName) {
    return Text(
      labelName,
      style: TextStyle(
          color: primaryColor,
          fontSize: Dimensions.pixels_20,
          fontWeight: FontWeight.w600),
    );
  }

  void _cityBottomSheet(BuildContext context) {
    showModalBottomSheet(
        barrierColor: hintGrey.withOpacity(0.3),
        backgroundColor: Colors.transparent,
        isDismissible: true,
        context: context,
        elevation: Dimensions.pixels_15,
        builder: (BuildContext bc) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.pixels_24),
                    topRight: Radius.circular(Dimensions.pixels_24)),
                color: Colors.white,
              ),
              padding: EdgeInsets.only(top: Dimensions.pixels_20),
              child: new Wrap(
                children: <Widget>[
                  Align(
                    child: Container(
                      height: Dimensions.pixels_8,
                      width: Dimensions.pixels_50,
                      decoration: BoxDecoration(
                          color: orange,
                          borderRadius:
                              BorderRadius.circular(Dimensions.pixels_15)),
                    ),
                    alignment: Alignment.topCenter,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: Dimensions.pixels_15),
                    width: double.infinity,
                    //   color: AppColors.white,
                    child: Text(
                      "Select City",
                      style: TextStyle(
                          fontSize: Dimensions.pixels_18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.pixels_20,
                        right: Dimensions.pixels_20,
                        top: Dimensions.pixels_25),
                    child: ListTile(
                        trailing: Container(
                            height: Dimensions.pixels_25,
                            width: Dimensions.pixels_25,
                            child: Image.asset(
                              checkbox_checked,
                              color: orange,
                            )),
                        title: Text(
                          'RIYADH',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.pixels_16,
                              fontWeight: FontWeight.w500),
                        ),
                        onTap: () {
                          //onChangeLabel(true, context);
                          //     onChangeLabel(true);
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.pixels_20,
                        right: Dimensions.pixels_20,
                        bottom: Dimensions.pixels_25),
                    child: ListTile(
                        trailing: Container(
                            height: Dimensions.pixels_25,
                            width: Dimensions.pixels_25,
                            child: Image.asset(checkbox_uncheck)),
                        title: new Text(
                          'DAMMAM',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.pixels_16,
                              fontWeight: FontWeight.w500),
                        ),
                        onTap: () {
                          // onChangeLabel(false, context);
                          //  onChangeLabel(false);
                        }),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
