import 'package:customer_end/controllers/get_orders.dart';
import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cancelled_order_page.dart';
import 'current_order_page.dart';
import 'delivered_oorder_page.dart';

class BottomOrderPage extends StatefulWidget {
  @override
  _BottomOrderPageState createState() => _BottomOrderPageState();
}

class _BottomOrderPageState extends State<BottomOrderPage>
    with BaseClass, SingleTickerProviderStateMixin {
  TabController _tabController;
  static int pageIndex = 0;
  GetOrdersController _getOrdersController =
      Get.isRegistered<GetOrdersController>()
          ? Get.find<GetOrdersController>()
          : Get.put(GetOrdersController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(vsync: this, length: 3, initialIndex: pageIndex);
    _getOrdersController.getOrderListApi();
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
        leading: Container(),
        centerTitle: true,
      ),
      body: GetBuilder<GetOrdersController>(
          init: _getOrdersController,
          builder: (value) {
            return Container(
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
                        indicatorColor: Colors.transparent,
                        labelPadding: EdgeInsets.zero,
                        indicator: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.pixels_12),
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
                            text: "Current",
                          ),
                          Tab(
                            text: "Delivered",
                          ),
                          Tab(
                            text: "Cancelled",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _tabController,
                        children: [
                          CurrentOrderPage(),
                          DeliveredOrderPage(),
                          CancelledOrderPage(),
                          /* MyOrderItems(0),
                        MyOrderItems(1),
                        MyOrderItems(2),*/
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
