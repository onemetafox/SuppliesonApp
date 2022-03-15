import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/app_images.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../controllers/get_orders.dart';

class CurrentOrderPage extends StatelessWidget with BaseClass {
  final GetOrdersController _getOrdersController =
      Get.isRegistered<GetOrdersController>()
          ? Get.find<GetOrdersController>()
          : Get.put(GetOrdersController());

  @override
  Widget build(BuildContext context) {
    _getOrdersController.getOrderListApi();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        shadowColor: orange,
        title: Text("Orders"),
        leading: Container(),
        centerTitle: true,
      ),
      body: GetBuilder<GetOrdersController>(
          init: _getOrdersController,
          builder: (value) {
            return value.getOrdersModel == null
                ? Center(
                    child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                      darkBlue,
                    ),
                  ))
                : value.getOrdersModel.data.orders.length == 0
                    ? Center(
                        child: Text(
                          "No Orders Found",
                          style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    : Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: Dimensions.pixels_20,
                                right: Dimensions.pixels_20,
                                top: Dimensions.pixels_15,
                                bottom: Dimensions.pixels_5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        "Total Products",
                                        style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Text(
                                      value.getOrdersModel.data.count
                                          .toString(),
                                      style: GoogleFonts.montserrat(
                                          color: Colors.blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 20,
                                  width: 2,
                                  color: Colors.grey,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        "Total Revenue",
                                        style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Text(
                                      value.getOrdersModel.data.ordersRevenue
                                              .toStringAsFixed(2) +
                                          " SAR",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(
                                left: Dimensions.pixels_16,
                                right: Dimensions.pixels_16,
                                top: Dimensions.pixels_15,
                                bottom: Dimensions.pixels_15),
                            child: ListView.builder(
                              itemCount:
                                  value.getOrdersModel.data.orders.length,
                              itemBuilder: (context, int index) {
                                return _getNotificationWidget(
                                    context: context,
                                    image: groceryImage,
                                    storeName: value.getOrdersModel.data.orders
                                        .elementAt(index)
                                        .branchName
                                        .toString(),
                                    orderNumber: value
                                        .getOrdersModel.data.orders
                                        .elementAt(index)
                                        .orderId
                                        .toString(),
                                    productCount: value
                                        .getOrdersModel.data.orders
                                        .elementAt(index)
                                        .items
                                        .toString(),
                                    orderStatus: value
                                        .getOrdersModel.data.orders
                                        .elementAt(index)
                                        .status
                                        .toString(),
                                    date: value.getOrdersModel.data.orders
                                        .elementAt(index)
                                        .createdAt
                                        .toString(),
                                    price: value.getOrdersModel.data.orders
                                        .elementAt(index)
                                        .total
                                        .toString());
                              },
                            ),
                          )),
                        ],
                      );
          }),
    );
  }

  Widget _getNotificationWidget(
      {BuildContext context,
      String image,
      String storeName,
      String orderNumber,
      String productCount,
      String orderStatus,
      String date,
      String price}) {
    return Column(
      children: [
        Card(
          elevation: Dimensions.pixels_5,
          child: Padding(
            padding: EdgeInsets.only(
                top: Dimensions.pixels_10, bottom: Dimensions.pixels_10),
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date",
                    style: TextStyle(
                        color: hintGrey,
                        fontSize: Dimensions.pixels_14,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse(
                        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                            .parse(date)
                            .toString())),
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: Dimensions.pixels_14,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimensions.pixels_15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Branch Name",
                        style: TextStyle(
                            color: hintGrey,
                            fontSize: Dimensions.pixels_14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        storeName,
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: Dimensions.pixels_14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.pixels_5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order ID",
                        style: TextStyle(
                            color: hintGrey,
                            fontSize: Dimensions.pixels_14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        orderNumber,
                        style: TextStyle(
                            color: hintGrey,
                            fontSize: Dimensions.pixels_14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.pixels_5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                            color: hintGrey,
                            fontSize: Dimensions.pixels_14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        price +" SAR",
                        style: TextStyle(
                            color: hintGrey,
                            fontSize: Dimensions.pixels_14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.pixels_15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: orderStatus == "OutForDelivery"
                                ? Colors.amber
                                : orderStatus == "Rejected"
                                    ? Colors.red
                                    : orderStatus == "Delivered"
                                        ? Colors.green
                                        : Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          orderStatus == "OutForDelivery"
                              ? "Out for delivery"
                              : orderStatus == "Rejected"
                                  ? "Rejected"
                                  : orderStatus == "Canceled"
                                      ? "Cancelled"
                                      : orderStatus == "Delivered"
                                          ? "Delivered"
                                          : "",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimensions.pixels_14,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Text(
                        productCount == "0"
                            ? "No Items"
                            : "$productCount Items",
                        style: TextStyle(
                            color: Colors.blue,
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
