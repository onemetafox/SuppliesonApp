import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/app_images.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:customer_end/widgets/form_input.dart';
import 'package:customer_end/widgets/rounded_edge_button.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OfferItemDetailPage extends StatefulWidget {
  @override
  _OfferItemDetailPageState createState() => _OfferItemDetailPageState();
}

class _OfferItemDetailPageState extends State<OfferItemDetailPage> {
  FocusNode _instructionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Suntop BlackCurrant"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: Dimensions.pixels_280,
                width: double.infinity,
                child: Image(image: AssetImage(supplyon_logo)),
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
                    "Suntop BlackCurrant",
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
                            "Bio",
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
                      "8 PCS x 9 PKTS",
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
                      "132.25 SAR",
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
          Container(
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
          ),
          SizedBox(
            height: Dimensions.pixels_30,
          ),
          Container(
            margin: EdgeInsets.only(
                left: Dimensions.pixels_16, right: Dimensions.pixels_16),
            child: Text(
              "QTY",
              style: TextStyle(color: primaryColor),
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
                    Container(
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
                    Text(
                      "1",
                      style: TextStyle(color: primaryColor),
                    ),
                    Container(
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
                onPressed: (_) {},
                context: context),
          )
        ],
      ),
    );
  }
}
