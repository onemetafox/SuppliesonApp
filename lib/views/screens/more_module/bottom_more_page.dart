import 'dart:ui';
import 'package:customer_end/controllers/user_data/get_shared_pref.dart';
import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/app_images.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:customer_end/views/screens/login/login_page.dart';
import 'package:customer_end/views/screens/reports/report_page.dart';
import 'package:customer_end/widgets/more_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'contact_us_page.dart';
import 'my_favourite_page.dart';
import 'my_profile_module/my_profile_base_page.dart';
import 'my_quotation_module/my_quotation_base_page.dart';

class BottomMorePage extends StatelessWidget
    with
        /*StatefulWidget {
  @override
  _BottomMorePageState createState() => _BottomMorePageState();
}

class _BottomMorePageState extends State<BottomMorePage>  with */
        BaseClass {
  final GetSharedPref getSharedPref = Get.isRegistered<GetSharedPref>()
      ? Get.find<GetSharedPref>()
      : Get.put(GetSharedPref());

  void onOptionTap(int index, BuildContext context) {
    if (index == 0) {
      pushToNextScreenWithFadeAnimation(
          context: context, destination: MyProfileBasePage());
    } else if (index == 1) {
      pushToNextScreenWithFadeAnimation(
          context: context, destination: MyFavouritePage());
    } else if (index == 3) {
      pushToNextScreenWithFadeAnimation(
          context: context, destination: MyQuotationBasePage());
    } else if (index == 5) {
      _changeLanguageBottomSheet(context);
    } else if (index == 6) {
      pushToNextScreenWithFadeAnimation(
          context: context, destination: ContactUsPage());
    } else if (index == 9) {
      _logoutBottomSheet(context);
    } else if (index == 10) {
      pushToNextScreenWithAnimation(
          context: context, destination: ReportsPage());
    }
  }

  final bool isNotification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("More"),
        leading: Container(),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(
            left: Dimensions.pixels_16, right: Dimensions.pixels_16),
        child: ListView(
          children: [
            SizedBox(
              height: Dimensions.pixels_20,
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.supervised_user_circle,
                  size: Dimensions.pixels_40,
                ),
                title: Text(
                  "Welcome",
                  style: TextStyle(
                      color: Colors.grey, fontSize: Dimensions.pixels_14),
                ),
                subtitle: Text(
                  getSharedPref.userDataModel.isLoggedIn == null
                      ? ''
                      : getSharedPref.userDataModel.isLoggedIn
                          ? getSharedPref.userDataModel.firstName
                          : "Sign Up/Login",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: Dimensions.pixels_18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            MoreOptionWidget(
              title: "My Profile",
              leadingIcon: _getLeadingIcon(Icons.people_alt_outlined),
              trailingIcon: _getTrailingArrowIcon(),
              titleColor: primaryColor,
              index: 0,
              onClicked: onOptionTap,
              buildContext: context,
            ),
            MoreOptionWidget(
              title: "My Favourite",
              leadingIcon: Icon(
                Icons.favorite_border,
                color: primaryColor,
              ),
              trailingIcon: _getTrailingArrowIcon(),
              titleColor: primaryColor,
              index: 1,
              onClicked: onOptionTap,
              buildContext: context,
            ),
            MoreOptionWidget(
              title: "My Delivery Addresses",
              leadingIcon: _getLeadingIcon(Icons.location_on_outlined),
              trailingIcon: _getTrailingArrowIcon(),
              titleColor: primaryColor,
              index: 2,
              onClicked: onOptionTap,
              buildContext: context,
            ),
            MoreOptionWidget(
              title: "My Quotation",
              leadingIcon: _getLeadingIcon(Icons.notifications_none),
              trailingIcon: _getTrailingArrowIcon(),
              titleColor: primaryColor,
              index: 3,
              onClicked: onOptionTap,
              buildContext: context,
            ),
            Divider(
              color: Colors.grey,
            ),
            MoreOptionWidget(
              title: "Reports",
              leadingIcon: _getLeadingIcon(Icons.report_gmailerrorred_outlined),
              trailingIcon: _getTrailingArrowIcon(),
              titleColor: primaryColor,
              index: 10,
              onClicked: onOptionTap,
              buildContext: context,
            ),
            Divider(
              color: Colors.grey,
            ),
            Row(
              children: [
                _getLeadingIcon(Icons.notifications_none),
                SizedBox(
                  width: Dimensions.pixels_12,
                ),
                Expanded(
                  child: SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    value: isNotification,
                    onChanged: (bool value) {
                      /*setState(() {
                        isNotification =value;
                      });*/
                    },
                    activeColor: primaryColor,
                    title: Text(
                      "Notification",
                      style: TextStyle(color: black),
                    ),
                  ),
                ),
              ],
            ),
            /*MoreOptionWidget(
              title: "Notification",
              leadingIcon: _getLeadingIcon(Icons.notifications_none),
              trailingIcon: _getTrailingArrowIcon(),
              titleColor: primaryColor,
              index: 4,
              onClicked: onOptionTap,
              buildContext: context,
            ),*/
            MoreOptionWidget(
              title: "Language",
              leadingIcon: Icon(
                Icons.language,
                color: primaryColor,
              ),
              trailingIcon: _getTrailingArrowIcon(),
              titleColor: primaryColor,
              index: 5,
              onClicked: onOptionTap,
              buildContext: context,
            ),
            MoreOptionWidget(
              title: "Contact Us",
              leadingIcon: _getLeadingIcon(Icons.message_outlined),
              trailingIcon: _getTrailingArrowIcon(),
              titleColor: primaryColor,
              index: 6,
              onClicked: onOptionTap,
              buildContext: context,
            ),
            MoreOptionWidget(
              title: "Rate App",
              leadingIcon: _getLeadingIcon(Icons.star_border),
              trailingIcon: _getTrailingArrowIcon(),
              titleColor: primaryColor,
              index: 7,
              onClicked: onOptionTap,
              buildContext: context,
            ),
            Divider(
              color: Colors.grey,
            ),
            MoreOptionWidget(
              title: "Terms And condition",
              leadingIcon: _getLeadingIcon(Icons.privacy_tip_outlined),
              trailingIcon: _getTrailingArrowIcon(),
              titleColor: primaryColor,
              index: 8,
              onClicked: onOptionTap,
              buildContext: context,
            ),
            MoreOptionWidget(
              title: "Logout",
              leadingIcon: _getLeadingIcon(Icons.logout, iconColor: Colors.red),
              trailingIcon: _getTrailingArrowIcon(),
              titleColor: Colors.red,
              index: 9,
              onClicked: onOptionTap,
              buildContext: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getTrailingArrowIcon() {
    return Icon(
      Icons.arrow_forward_ios_sharp,
      color: Colors.grey,
      size: Dimensions.pixels_15,
    );
  }

  Widget _getLeadingIcon(
    IconData iconName, {
    Color iconColor = primaryColor,
  }) {
    return Icon(
      iconName,
      color: iconColor,
      size: Dimensions.pixels_20,
    );
  }

  void _changeLanguageBottomSheet(BuildContext context) {
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
                      "Select Language",
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
                          'English Language',
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
                          'اللغة العربية',
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

  void _logoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
        barrierColor: hintGrey.withOpacity(0.3),
        backgroundColor: Colors.transparent,
        isDismissible: true,
        context: context,
        elevation: 15,
        builder: (BuildContext bc) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0)),
                color: Colors.white,
              ),
              padding: EdgeInsets.only(top: 20.0),
              child: new Wrap(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    //   margin: EdgeInsets.only(top: 24.0),
                    width: double.infinity,
                    //   color: AppColors.white,
                    child: Text(
                      "Logout",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 24.0),
                    child: Text(
                      "Are you sure you want to logout?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: hintGrey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 17.0, top: 59.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            height: 56,
                            width: 150,
                            child: Card(
                              color: primaryColor,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              child: Center(
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            popToPreviousScreen(context: context);
                            getSharedPref.clearPreference();
                            Get.offAll(() => LoginPage());
                            // callLogoutApi(context);
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            popToPreviousScreen(context: context);
                          },
                          child: Container(
                            height: 56,
                            width: 150,
                            child: Card(
                              color: selectLanguageGrey,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              child: Center(
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
