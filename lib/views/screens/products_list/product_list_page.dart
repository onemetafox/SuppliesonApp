import 'package:customer_end/controllers/products_as_per_category/products_as_per_category_controller.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/views/screens/item_details/item_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/widget_dimensions.dart';
import '../cart_list/user_cart_item_list.dart';
import '../home_module/offer_item_detail_page.dart';

class ProductListPage extends StatelessWidget with BaseClass {
  final String supplierId;

  final String categoryId;

  final String categoryName;

  ProductListPage({this.supplierId, this.categoryId, this.categoryName});

  final ProductsAsPerCategoryController _productsAsPerCategoryController =
      Get.isRegistered<ProductsAsPerCategoryController>()
          ? Get.find<ProductsAsPerCategoryController>()
          : Get.put(ProductsAsPerCategoryController());

  @override
  Widget build(BuildContext context) {
    _productsAsPerCategoryController.getProducts(supplierId, categoryId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
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
      body: GetBuilder<ProductsAsPerCategoryController>(
          init: _productsAsPerCategoryController,
          builder: (value) {
            return value.productListModel == null
                ? Center(
                    child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                      darkBlue,
                    ),
                  ))
                : value.productListModel.data.products.length == 0
                    ? Center(
                        child: Text(
                          'No Products Found',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    : ListView.builder(
                        itemCount: value.productListModel.data.products.length,
                        shrinkWrap: true,
                        itemBuilder: (context, int index) {
                          return GestureDetector(
                            onTap: () {
                              pushToNextScreenWithAnimation(
                                  context: context,
                                  destination: ItemDetailsPage(
                                      productDetail: value
                                          .productListModel.data.products
                                          .elementAt(index)));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 16, right: 16, bottom: 10, top: 10),
                                height: Dimensions.pixels_200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                        image: NetworkImage(value
                                            .productListModel.data.products
                                            .elementAt(index)
                                            .coverPhoto),
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(20),
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
                                                value.productListModel.data
                                                    .products
                                                    .elementAt(index)
                                                    .englishName,
                                                style: GoogleFonts.roboto(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(
                                                height: Dimensions.pixels_10,
                                              ),
                                              Text(
                                                "${value.productListModel.data.products.elementAt(index).price} SAR / PC",
                                                style: GoogleFonts.roboto(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
          }),
    );
  }
}
