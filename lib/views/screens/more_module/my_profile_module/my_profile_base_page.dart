
import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:customer_end/views/screens/more_module/my_profile_module/profile_my_facility_tab_page.dart';
import 'package:customer_end/views/screens/more_module/my_profile_module/profile_my_information_tab_page.dart';
import 'package:flutter/material.dart';

class MyProfileBasePage extends StatefulWidget {
  @override
  _MyProfileBasePageState createState() => _MyProfileBasePageState();
}

class _MyProfileBasePageState extends State<MyProfileBasePage>
    with BaseClass, SingleTickerProviderStateMixin {
  TabController _tabController;
  static int pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(vsync: this, length: 2, initialIndex: pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        shadowColor: orange,
        title: Text("My Profile"),
        centerTitle: true,
        bottom: TabBar(
          labelColor: Colors.white,
          indicatorColor: Colors.transparent,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: orange,
          ),
          onTap: (index) {
            pageIndex = index;
          },
          indicatorWeight: 3.0,
          /*indicatorSize: TabBarIndicatorSize.label,*/
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          unselectedLabelColor: darkGray,
          labelStyle: TextStyle(
              fontWeight: FontWeight.w500, fontSize: Dimensions.pixels_14),
          unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w400, fontSize: Dimensions.pixels_14),
          tabs: [
            Tab(
              text: "My Information",
            ),
            Tab(
              text: "My Facility",
            ),
          ],
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          MyProfileMyInformationPage(),
          MyProfileFacilityPage(),
          /* MyOrderItems(0),
          MyOrderItems(1),
          MyOrderItems(2),*/
        ],
      ),
    );
  }
}
