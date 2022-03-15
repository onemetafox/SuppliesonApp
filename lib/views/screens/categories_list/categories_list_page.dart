import 'package:customer_end/controllers/get_category_list/get_category_list_controller.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/widget_dimensions.dart';
import '../cart_list/user_cart_item_list.dart';
import '../products_list/product_list_page.dart';

class CategoryListPage extends StatelessWidget with BaseClass {
  final GetCategoryListController _getCategoryListController =
      Get.isRegistered<GetCategoryListController>()
          ? Get.find<GetCategoryListController>()
          : Get.put(GetCategoryListController());
  final String supplierName;

  final String supplierId;

  CategoryListPage(this.supplierName, this.supplierId);

  @override
  Widget build(BuildContext context) {
    _getCategoryListController.getCartListApi(supplierId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          supplierName,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: darkBlue,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => ItemCartListPage(
                    supplierId: supplierId,
                  ));
            },
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 20,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: GetBuilder<GetCategoryListController>(
          init: _getCategoryListController,
          builder: (value) {
            return value.categoryListModel == null
                ? Center(
                    child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                      darkBlue,
                    ),
                  ))
                : value.categoryListModel.data.categories.length == 0
                    ? Center(
                        child: Text(
                          'No Categories Found',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: GridView.builder(
                          itemCount: _getCategoryListController
                              .categoryListModel.data.categories.length,
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
                                Get.to(() => ProductListPage(
                                      supplierId: supplierId,
                                      categoryId: _getCategoryListController
                                          .categoryListModel.data.categories
                                          .elementAt(position)
                                          .Id,
                                      categoryName: _getCategoryListController
                                          .categoryListModel.data.categories
                                          .elementAt(position)
                                          .englishName,
                                    ));
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: Dimensions.pixels_15,
                                    left: Dimensions.pixels_5,
                                    right: Dimensions.pixels_5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    //color: backgroundColor,
                                    border:
                                        Border.all(color: darkBlue, width: 2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      _getCategoryListController
                                          .categoryListModel.data.categories
                                          .elementAt(position)
                                          .englishName,
                                      style: GoogleFonts.roboto(
                                          color: Colors.deepOrange,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 1.3),
                        ),
                      );
          }),
    );
  }
}
