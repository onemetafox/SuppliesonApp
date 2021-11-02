
import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/app_images.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:customer_end/views/screens/prodcuts/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class SubCategoryPage extends StatefulWidget {
  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> with BaseClass {
  final List<String> subCategories = [
    'All Products',
    'Donuts',
    'Breads',
    'Ice Creams',
    'Kinder Donut (Large)',
    'All Products',
    'Donuts',
    'Breads',
    'Ice Creams',
    'Kinder Donut (Large'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bakery'),
        backgroundColor: darkBlue,
      ),
      body: Container(
        margin: EdgeInsets.all(12),
        child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 12,
            itemCount: subCategories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  pushToNextScreenWithAnimation(
                      context: context,
                      destination: ProductsPage(subCategories.elementAt(index)));
                },
                child: Container(

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [orange, darkBlue],
                        begin: FractionalOffset(0, 0),
                        end: FractionalOffset(0, 1),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Container(

                    child: Center(
                      child: Text(
                        subCategories.elementAt(index),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              );
            },
            staggeredTileBuilder: (index) {
              return StaggeredTile.count(
                1,
                index.isEven ? 1.2 : 1.8,
              );
            }),
      ),
    );
  }
}
