
import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/app_images.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:customer_end/widgets/form_input.dart';
import 'package:customer_end/widgets/rounded_edge_button.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'offer_item_detail_page.dart';

class OfferDetailsPage extends StatefulWidget {
  @override
  _OfferDetailsPageState createState() => _OfferDetailsPageState();
}

class _OfferDetailsPageState extends State<OfferDetailsPage> with BaseClass {
  FocusNode _searchNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Offer Name"),
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
                right: 0,
                child: Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.pixels_12, right: Dimensions.pixels_12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Offer label",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: Dimensions.pixels_18),
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: orange,
                        size: Dimensions.pixels_25,
                      )
                    ],
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
                    Text(
                      "Offer Name",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: Dimensions.pixels_16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.pixels_12,
                    ),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: Dimensions.pixels_14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.pixels_12,
                    ),
                    RoundedEdgeButton(
                      height: Dimensions.pixels_56,
                      color: orange,
                      buttonRadius: Dimensions.pixels_8,
                      textFontSize: Dimensions.pixels_16,
                      textColor: Colors.white,
                      text: "Our Branches",
                      onPressed: (_) {},
                      context: context,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: Dimensions.pixels_16, right: Dimensions.pixels_16),
            child: FormInput(
              label: "",
              onChanged: (_) {},
              focusNode: _searchNode,
              hintText: "Search",
              prefixIcon: Icon(
                Icons.search,
                color: hintGrey,
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.pixels_30,
          ),
          Container(
            margin: EdgeInsets.only(
                left: Dimensions.pixels_16, right: Dimensions.pixels_16),
            child: Container(
              color: lightGrey,
              child: ExpandablePanel(
                header: Padding(
                  padding: EdgeInsets.all(Dimensions.pixels_10),
                  child: Text(
                    "Juices",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: Dimensions.pixels_18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                //collapsed: Text("article.body ONE", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                expanded: Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.pixels_14, right: Dimensions.pixels_14),
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop BlackCurrant",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Berry",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Mixed Fruit",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Orange",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                    ],
                  ),
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
            child: Container(
              color: lightGrey,
              child: ExpandablePanel(
                header: Padding(
                  padding: EdgeInsets.all(Dimensions.pixels_10),
                  child: Text(
                    "Juices",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: Dimensions.pixels_18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                //collapsed: Text("article.body ONE", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                expanded: Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.pixels_14, right: Dimensions.pixels_14),
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop BlackCurrant",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Berry",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Mixed Fruit",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Orange",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                    ],
                  ),
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
            child: Container(
              color: lightGrey,
              child: ExpandablePanel(
                header: Padding(
                  padding: EdgeInsets.all(Dimensions.pixels_10),
                  child: Text(
                    "Juices",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: Dimensions.pixels_18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                //collapsed: Text("article.body ONE", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                expanded: Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.pixels_14, right: Dimensions.pixels_14),
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop BlackCurrant",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Berry",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Mixed Fruit",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Orange",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                    ],
                  ),
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
            child: Container(
              color: lightGrey,
              child: ExpandablePanel(
                header: Padding(
                  padding: EdgeInsets.all(Dimensions.pixels_10),
                  child: Text(
                    "Juices",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: Dimensions.pixels_18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                //collapsed: Text("article.body ONE", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                expanded: Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.pixels_14, right: Dimensions.pixels_14),
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop BlackCurrant",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Berry",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Mixed Fruit",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Orange",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                    ],
                  ),
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
            child: Container(
              color: lightGrey,
              child: ExpandablePanel(
                header: Padding(
                  padding: EdgeInsets.all(Dimensions.pixels_10),
                  child: Text(
                    "Juices",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: Dimensions.pixels_18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                //collapsed: Text("article.body ONE", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                expanded: Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.pixels_14, right: Dimensions.pixels_14),
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop BlackCurrant",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Berry",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Mixed Fruit",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Orange",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                    ],
                  ),
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
            child: Container(
              color: lightGrey,
              child: ExpandablePanel(
                header: Padding(
                  padding: EdgeInsets.all(Dimensions.pixels_10),
                  child: Text(
                    "Juices",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: Dimensions.pixels_18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                //collapsed: Text("article.body ONE", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                expanded: Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.pixels_14, right: Dimensions.pixels_14),
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop BlackCurrant",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Berry",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Mixed Fruit",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Orange",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                    ],
                  ),
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
            child: Container(
              color: lightGrey,
              child: ExpandablePanel(
                header: Padding(
                  padding: EdgeInsets.all(Dimensions.pixels_10),
                  child: Text(
                    "Juices",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: Dimensions.pixels_18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                //collapsed: Text("article.body ONE", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                expanded: Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.pixels_14, right: Dimensions.pixels_14),
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop BlackCurrant",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Berry",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Mixed Fruit",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            pushToNextScreenWithAnimation(
                                context: context,
                                destination: OfferItemDetailPage());
                          },
                          title: Text(
                            "Suntop Orange",
                            softWrap: true,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.pixels_14,
                            ),
                          ),
                          leading: Image(
                            image: AssetImage(groceryImage),
                            height: Dimensions.pixels_40,
                            width: Dimensions.pixels_40,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: hintGrey,
                            size: Dimensions.pixels_15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.pixels_10,
          ),
        ],
      ),
    );
  }
}
