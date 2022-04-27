import 'package:customer_end/controllers/get_branches/get_branches_controller.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/views/bottom_sheets/get_branches/branches_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/cart_list/get_cart_list_controller.dart';
import '../../../controllers/checkout_cart/checkout_cart_controller.dart';
import '../../../controllers/remove_cart_product/remove_cart_product_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

class ItemCartListPage extends StatefulWidget {
  final String supplierId;

  ItemCartListPage({
    this.supplierId,
  });

  @override
  State<ItemCartListPage> createState() => _ItemCartListPageState();
}

class _ItemCartListPageState extends State<ItemCartListPage> with BaseClass {
  final GetCartListController _getCartListController =
      Get.isRegistered<GetCartListController>()
          ? Get.find<GetCartListController>()
          : Get.put(GetCartListController());

  final CheckOutCartController _checkOutCartController =
      Get.isRegistered<CheckOutCartController>()
          ? Get.find<CheckOutCartController>()
          : Get.put(CheckOutCartController());

  final GetBranchesController _getBranchesController =
      Get.isRegistered<GetBranchesController>()
          ? Get.find<GetBranchesController>()
          : Get.put(GetBranchesController());

  final RemoveCartProductController _removeCartProductController =
      Get.isRegistered<RemoveCartProductController>()
          ? Get.find<RemoveCartProductController>()
          : Get.put(RemoveCartProductController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getCartListController.getCartListApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: darkBlue,
          centerTitle: true,
        ),
        body: GetBuilder<GetCartListController>(
            init: _getCartListController,
            builder: (value) {
              return value.cartListModel == null
                  ? Center(
                      child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                        darkBlue,
                      ),
                    ))
                  : value.cartListModel.data.length == 0
                      ? Center(
                          child: Text(
                            'No Cart Items Found',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      : Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              top: 10,
                              left: 20,
                              right: 20,
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(8),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Select branch',
                                        style: GoogleFonts.roboto(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      GetBuilder<GetBranchesController>(
                                          init: _getBranchesController,
                                          builder: (value) {
                                            return InkWell(
                                              onTap: () {
                                                GetBranchesBottomSheet()
                                                    .getBranchesBottomSheet(
                                                        context, (value) {});
                                              },
                                              child: Container(
                                                height: 40,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color:
                                                      darkBlue.withOpacity(0.3),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    _getBranchesController
                                                                .getSelectedIndex !=
                                                            -1
                                                        ? _getBranchesController
                                                            .branchesModel.data
                                                            .elementAt(
                                                                _getBranchesController
                                                                    .getSelectedIndex)
                                                            .branchName
                                                        : 'Select branch',
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.7),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 130, top: 80),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: value.cartListModel.data
                                      .elementAt(0)
                                      .cart
                                      .products
                                      .length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text('Product Name: ' +
                                                        value.cartListModel.data
                                                            .elementAt(0)
                                                            .cart
                                                            .products
                                                            .elementAt(index)
                                                            .product
                                                            .englishDescription),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text('Quantity: ' +
                                                        value.cartListModel.data
                                                            .elementAt(0)
                                                            .cart
                                                            .products
                                                            .elementAt(index)
                                                            .quantity
                                                            .toString()),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text('Price: ' +
                                                        (value.cartListModel
                                                                .data
                                                                .elementAt(0)
                                                                .cart
                                                                .products
                                                                .elementAt(
                                                                    index)
                                                                .price)
                                                            .toString() +
                                                        ' SAR / PC'),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text('Total price: ' +
                                                        (value.cartListModel
                                                                    .data
                                                                    .elementAt(
                                                                        0)
                                                                    .cart
                                                                    .products
                                                                    .elementAt(
                                                                        index)
                                                                    .price *
                                                                value
                                                                    .cartListModel
                                                                    .data
                                                                    .elementAt(
                                                                        0)
                                                                    .cart
                                                                    .products
                                                                    .elementAt(
                                                                        index)
                                                                    .quantity)
                                                            .toString()),
                                                  ],
                                                ),
                                              )),
                                              GestureDetector(
                                                onTap: () async {
                                                  showCircularDialog(context);
                                                  try {
                                                    // print(value);
                                                    await value
                                                        .removeCartProductApi(
                                                            value.cartListModel
                                                                .data
                                                                .elementAt(0)
                                                                .cart
                                                                .products
                                                                .elementAt(index)
                                                                .product
                                                                .Id,
                                                            index);
                                                    Get.back();
                                                  } catch (e) {
                                                    Get.back();
                                                    showError(
                                                        title: 'Error',
                                                        message: e.toString());
                                                  }
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                  size: 25,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider()
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 120,
                                color: Colors.orange,
                                width: double.infinity,
                                padding: EdgeInsets.all(8),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'SUB TOTAL ',
                                            style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            (value.cartListModel.data
                                                            .elementAt(0)
                                                            .total -
                                                        value.cartListModel.data
                                                            .elementAt(0)
                                                            .VAT)
                                                    .toString() +
                                                ' SAR',
                                            style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'VAT ',
                                            style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            value.cartListModel.data
                                                    .elementAt(0)
                                                    .VAT
                                                    .toString() +
                                                ' SAR',
                                            style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'TOTAL ',
                                            style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            value.cartListModel.data
                                                    .elementAt(0)
                                                    .total
                                                    .toString() +
                                                ' SAR',
                                            style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          if (_getBranchesController
                                                  .getSelectedIndex ==
                                              -1) {
                                            showError(
                                                title: 'Error',
                                                message:
                                                    'Please select a branch');
                                          } else {
                                            showCircularDialog(context);
                                            try {
                                              await _checkOutCartController
                                                  .checkoutCartApi(
                                                      value.cartListModel.data
                                                          .elementAt(0)
                                                          .cart
                                                          .Id
                                                          .toString(),
                                                      _getBranchesController
                                                          .branchesModel.data
                                                          .elementAt(
                                                              _getBranchesController
                                                                  .getSelectedIndex)
                                                          .Id
                                                          .toString());
                                              Get.back();
                                              Get.back();
                                              showSuccess(
                                                  title: 'Error',
                                                  message:
                                                      'Order placed successfully');
                                            } catch (e) {
                                              Get.back();
                                              showError(
                                                  title: 'Error',
                                                  message: e.toString());
                                            }
                                          }
                                        },
                                        child: Container(
                                          height: 40,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: darkBlue,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Center(
                                            child: Text(
                                              'Checkout',
                                              style: GoogleFonts.roboto(
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
            }),
      ),
    );
  }
}
