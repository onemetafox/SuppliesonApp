import 'package:customer_end/controllers/add_product_to_cart/add_product_to_cart_controller.dart';
import 'package:customer_end/models/product_list/product_list_model.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/widget_dimensions.dart';
import '../../../widgets/form_input.dart';
import '../../../widgets/rounded_edge_button.dart';
import '../cart_list/user_cart_item_list.dart';

class ItemDetailsPage extends StatefulWidget {
  final ProductListModelDataProducts productDetail;

  ItemDetailsPage({
    this.productDetail,
  });

  @override
  _ItemDetailsPageState createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> with BaseClass {
  FocusNode _instructionFocusNode = FocusNode();
  int itemCount = 0;
  final AddProductToCartController _addProductToCartController =
      Get.isRegistered<AddProductToCartController>()
          ? Get.find<AddProductToCartController>()
          : Get.put(AddProductToCartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(widget.productDetail.englishName),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: (){
              Get.to(()=>ItemCartListPage());
            },
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 20,
            ),
          ),
          SizedBox(width: 10,),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: Dimensions.pixels_280,
                width: double.infinity,
                child: Image(
                  image: NetworkImage(widget.productDetail.coverPhoto),
                  fit: BoxFit.cover,
                ),
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    end: const Alignment(0.0, -1),
                    begin: const Alignment(0.0, 0.6),
                    colors: <Color>[
                      const Color(0x8A000000),
                      Colors.black12.withOpacity(0.0)
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: Dimensions.pixels_10,
                left: 0,
                child: Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.pixels_12, right: Dimensions.pixels_12),
                  child: Text(
                    widget.productDetail.englishName,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: Dimensions.pixels_18),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.pixels_12,
          ),
          Container(
            margin: EdgeInsets.only(
              left: Dimensions.pixels_10,
              right: Dimensions.pixels_10,
            ),
            child: Card(
              elevation: Dimensions.pixels_5,
              child: Padding(
                padding: EdgeInsets.all(Dimensions.pixels_12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Description",
                        style: TextStyle(
                          color: hintGrey,
                          fontSize: Dimensions.pixels_16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        widget.productDetail.englishDescription,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.pixels_16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.menu_book_sharp,
                          color: hintGrey,
                          size: Dimensions.pixels_25,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: Dimensions.pixels_10),
                          child: Text(
                            "Category",
                            style: TextStyle(
                              color: hintGrey,
                              fontSize: Dimensions.pixels_16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.pixels_12,
                    ),
                    Text(
                      widget.productDetail.categories.elementAt(0).englishName,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: Dimensions.pixels_18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.pixels_12,
          ),
          Container(
            margin: EdgeInsets.only(
              left: Dimensions.pixels_10,
              right: Dimensions.pixels_10,
            ),
            child: Card(
              elevation: Dimensions.pixels_5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: Dimensions.pixels_12,
                        right: Dimensions.pixels_12,
                        top: Dimensions.pixels_12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.payment,
                          color: hintGrey,
                          size: Dimensions.pixels_25,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: Dimensions.pixels_10),
                          child: Text(
                            "Price",
                            style: TextStyle(
                              color: hintGrey,
                              fontSize: Dimensions.pixels_14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.pixels_12,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: Dimensions.pixels_12,
                      right: Dimensions.pixels_12,
                    ),
                    child: Text(
                      widget.productDetail.price.toString() + " SAR ",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: Dimensions.pixels_16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    color: orange,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: Dimensions.pixels_5),
                    height: Dimensions.pixels_25,
                    child: Center(
                        child: Text(
                      "The price includes VAT",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ],
              ),
            ),
          ),
          /* Container(
            margin: EdgeInsets.only(
                left: Dimensions.pixels_16,
                right: Dimensions.pixels_16,
                top: Dimensions.pixels_16),
            child: FormInput(
              label: "Special Instructions (Optional)",
              onChanged: (_) {},
              focusNode: _instructionFocusNode,
              hintText: "e.g (Large meat ...)",
              textFieldHeight: Dimensions.pixels_60,
            ),
          ),*/
          SizedBox(
            height: Dimensions.pixels_30,
          ),
          Container(
            margin: EdgeInsets.only(
                left: Dimensions.pixels_20, right: Dimensions.pixels_20),
            child: Text(
              "QTY",
              style:
                  TextStyle(color: primaryColor, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: Dimensions.pixels_16, right: Dimensions.pixels_16),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(Dimensions.pixels_8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (itemCount != 0) {
                          itemCount--;
                          setState(() {});
                        }
                      },
                      child: Container(
                        height: Dimensions.pixels_40,
                        width: Dimensions.pixels_40,
                        decoration: BoxDecoration(
                            color: lightGrey,
                            borderRadius:
                                BorderRadius.circular(Dimensions.pixels_10)),
                        child: Icon(
                          Icons.remove,
                          color: primaryColor,
                          size: Dimensions.pixels_20,
                        ),
                      ),
                    ),
                    Text(
                      itemCount.toString(),
                      style: TextStyle(color: primaryColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        itemCount++;
                        setState(() {});
                      },
                      child: Container(
                        height: Dimensions.pixels_40,
                        width: Dimensions.pixels_40,
                        decoration: BoxDecoration(
                            color: lightGrey,
                            borderRadius:
                                BorderRadius.circular(Dimensions.pixels_10)),
                        child: Icon(
                          Icons.add,
                          color: primaryColor,
                          size: Dimensions.pixels_20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.pixels_10,
          ),
          Container(
            margin: EdgeInsets.only(
                left: Dimensions.pixels_16, right: Dimensions.pixels_16),
            child: RoundedEdgeButton(
                height: Dimensions.pixels_56,
                color: primaryColor,
                buttonRadius: Dimensions.pixels_4,
                text: "Add To Cart",
                textFontSize: Dimensions.pixels_16,
                textColor: Colors.white,
                onPressed: (_) async {
                  if (itemCount == 0) {
                    showError(
                        title: 'Item Count',
                        message: 'Item count cannot be zero');
                  } else {
                    showCircularDialog(context);
                    try {
                      await _addProductToCartController.addProductToCartApi({
                        "product": widget.productDetail.Id.toString(),
                        "quantity": itemCount.toString()
                      });
                      Get.back();
                      Get.back();
                      showSuccess(
                          title: 'Success',
                          message: "Item added to cart successfully");
                    } catch (e) {
                      print(e.toString());
                      Get.back();
                      showError(title: 'Error', message: e.toString());
                    }
                  }
                },
                context: context),
          )
        ],
      ),
    );
  }
}
