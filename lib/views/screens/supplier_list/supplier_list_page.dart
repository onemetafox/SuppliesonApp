import 'package:customer_end/controllers/get_suppliers_list/suppliers_list_controller.dart';
import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/views/screens/cart_list/user_cart_item_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/widget_dimensions.dart';
import '../categories_list/categories_list_page.dart';
import '../home_module/home_widgets/sector_widget.dart';

class SuppliersListPage extends StatelessWidget with BaseClass {
  final GetSuppliersListController _getSuppliersListController =
      Get.isRegistered<GetSuppliersListController>()
          ? Get.find<GetSuppliersListController>()
          : Get.put(GetSuppliersListController());

  @override
  Widget build(BuildContext context) {
    _getSuppliersListController.getSuppliersListApi();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Suppliers',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: darkBlue,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => ItemCartListPage());
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
      body: GetBuilder<GetSuppliersListController>(
          init: _getSuppliersListController,
          builder: (value) {
            return value.suppliersListModel == null
                ? Center(
                    child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                      darkBlue,
                    ),
                  ))
                : value.suppliersListModel.data.suppliers.length == 0
                    ? Center(
                        child: Text(
                          'No Suppliers Found',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: GridView.builder(
                          itemCount: _getSuppliersListController
                              .suppliersListModel.data.suppliers.length,
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
                                /*  pushToNextScreenWithAnimation(
                                context: context,
                                destination: SuppliersListPage());
*/
                                Get.to(() => CategoryListPage(
                                    _getSuppliersListController
                                        .suppliersListModel.data.suppliers
                                        .elementAt(position)
                                        .supplier
                                        .representativeName,
                                    _getSuppliersListController
                                        .suppliersListModel.data.suppliers
                                        .elementAt(position)
                                        .supplier
                                        .Id
                                        .toString()));

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
                                child: Container(
                                  decoration: BoxDecoration(
                                    //color: backgroundColor,
                                    border:
                                        Border.all(color: darkBlue, width: 2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      _getSuppliersListController
                                          .suppliersListModel.data.suppliers
                                          .elementAt(position)
                                          .supplier
                                          .representativeName,
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
