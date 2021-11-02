import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:customer_end/widgets/form_input.dart';
import 'package:customer_end/widgets/rounded_edge_button.dart';
import 'package:flutter/material.dart';

class MyProfileFacilityPage extends StatelessWidget {
  final FocusNode _establishmentName = FocusNode();
  final FocusNode _commercialNumber = FocusNode();
  final FocusNode _vatNumber = FocusNode();
  final FocusNode _expiryDate = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimensions.pixels_16, right: Dimensions.pixels_16),
      child: ListView(
        children: [
          SizedBox(
            height: Dimensions.pixels_30,
          ),
          CircleAvatar(
            radius: Dimensions.pixels_50,
            backgroundColor: primaryColor,
            child: Icon(
              Icons.person,
              size: Dimensions.pixels_40,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: Dimensions.pixels_20,
          ),
          FormInput(
            label: "Establishment Name",
            onChanged: (value) {},
            focusNode: _establishmentName,
          ),
          SizedBox(
            height: Dimensions.pixels_20,
          ),
          FormInput(
            label: "Commercial Register Number",
            onChanged: (value) {},
            focusNode: _commercialNumber,
          ),
          SizedBox(
            height: Dimensions.pixels_20,
          ),
          FormInput(
            label: "VAT registration number",
            onChanged: (value) {},
            focusNode: _vatNumber,
          ),
          SizedBox(
            height: Dimensions.pixels_20,
          ),
          FormInput(
            label: "CR Expiry Date",
            onChanged: (value) {},
            focusNode: _expiryDate,
            obscureText: true,
          ),


          SizedBox(
            height: Dimensions.pixels_40,
          ),
          RoundedEdgeButton(
              height: Dimensions.pixels_56,
              color: primaryColor,
              text: "Edit",
              buttonRadius: Dimensions.pixels_10,
              textFontSize: Dimensions.pixels_14,
              textColor: Colors.white,
              onPressed: (_) {},
              context: context),
        ],
      ),
    );
  }
}
