import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/app_images.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:customer_end/views/screens/subcategories/subcategory_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuppliersListPage extends StatelessWidget with BaseClass {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: darkBlue,
          title: Text(
            'Suppliers',
            style: GoogleFonts.roboto(
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            itemCount: 20,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int position) {
              // print(((getScreenWidth(context) / 2) /
              //     ((getScreenHeight(context) -
              //             kToolbarHeight -
              //             Dimensions.pixels_24) /
              //         2)));
              return GestureDetector(
                onTap: () {
                  pushToNextScreenWithAnimation(
                    context: context,
                    destination: SubCategoryPage(),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(
                      top: Dimensions.pixels_15,
                      left: Dimensions.pixels_5,
                      right: Dimensions.pixels_5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      child: Text(
                        'Baking up',
                        style: GoogleFonts.roboto(
                            color: darkBlue,
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
                      ),
                    ),
                  ),
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.3),
          ),
        ));
  }
}
