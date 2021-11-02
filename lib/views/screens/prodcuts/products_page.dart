
import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/app_images.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:customer_end/views/screens/home_module/offer_details_page.dart';
import 'package:customer_end/views/screens/home_module/offer_item_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsPage extends StatelessWidget with BaseClass {
  final String selectedProduct;

  ProductsPage(this.selectedProduct);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        title: Text(
          selectedProduct,
          style: GoogleFonts.roboto(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              margin:
              EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
              child: Text(
                "SPECIAL PRICES",
                style: GoogleFonts.roboto(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20),
              ),
            ),
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    onTap: () {
                      pushToNextScreenWithAnimation(
                          context: context, destination: OfferItemDetailPage());
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        margin:
                            EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
                        height: Dimensions.pixels_200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(
                                image: AssetImage(food),
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Cheesecake Cream Dount (Large)",
                                        style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: Dimensions.pixels_10,
                                      ),
                                      Text(
                                        "5 SAR / PC",
                                        style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 14),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            Container(
              margin:
              EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
              child: Text(
                "OTHER PRODUCTS",
                style: GoogleFonts.roboto(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20),
              ),
            ),

            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    onTap: () {
                      pushToNextScreenWithAnimation(
                          context: context, destination: OfferDetailsPage());
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        margin:
                        EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
                        height: Dimensions.pixels_200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(
                                image: AssetImage(food),
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Chocolate pool*15*",
                                        style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: Dimensions.pixels_10,
                                      ),
                                      Text(
                                        "",
                                        style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 14),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
