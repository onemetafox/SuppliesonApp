import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:customer_end/widgets/form_input.dart';
import 'package:customer_end/widgets/rounded_edge_button.dart';
import 'package:flutter/material.dart';

class MyProfileMyInformationPage extends StatelessWidget {
  final FocusNode _fullName = FocusNode();
  final FocusNode _phoneNumber = FocusNode();
  final FocusNode _email = FocusNode();
  final FocusNode _password = FocusNode();

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
            label: "Full Name",
            onChanged: (value) {},
            focusNode: _fullName,
          ),
          SizedBox(
            height: Dimensions.pixels_20,
          ),
          FormInput(
            label: "Phone Number",
            onChanged: (value) {},
            focusNode: _phoneNumber,
          ),
          SizedBox(
            height: Dimensions.pixels_20,
          ),
          FormInput(
            label: "Email",
            onChanged: (value) {},
            focusNode: _email,
          ),
          SizedBox(
            height: Dimensions.pixels_20,
          ),
          FormInput(
            label: "Password",
            onChanged: (value) {},
            focusNode: _password,
            obscureText: true,
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: FlatButton(
              height: Dimensions.pixels_40,
              onPressed: () {},
              child: Text(
                "Change Password",
                style: TextStyle(color: primaryColor),
              ),
            ),
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
