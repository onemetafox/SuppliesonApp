import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:flutter/material.dart';

class MyQuotationBasePage extends StatefulWidget {
  @override
  _MyQuotationBasePageState createState() => _MyQuotationBasePageState();
}

class _MyQuotationBasePageState extends State<MyQuotationBasePage>
    with BaseClass, SingleTickerProviderStateMixin {
  TabController _tabController;
  static int pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(vsync: this, length: 3, initialIndex: pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        shadowColor: orange,
        title: Text("Quotations"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(
            top: Dimensions.pixels_10,
            left: Dimensions.pixels_5,
            right: Dimensions.pixels_5),
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(maxHeight: 150.0),
                child: TabBar(
                  labelColor: primaryColor,
                  indicatorColor: Colors.transparent,labelPadding: EdgeInsets.zero,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.pixels_12),
                    color: orange,
                  ),
                  onTap: (index) {
                    pageIndex = index;
                  },
                  indicatorWeight: Dimensions.pixels_3,
                  /*indicatorSize: TabBarIndicatorSize.label,*/
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: _tabController,
                  unselectedLabelColor: darkGray,
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: Dimensions.pixels_14),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: Dimensions.pixels_14,
                  ),
                  tabs: [
                    Tab(
                      text: "Pending",
                    ),
                    Tab(
                      text: "Waiting for Approve",
                    ),
                    Tab(
                      text: "Closed",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    Container(),
                    Container(),
                    Container(),
                    /* MyOrderItems(0),
                    MyOrderItems(1),
                    MyOrderItems(2),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
