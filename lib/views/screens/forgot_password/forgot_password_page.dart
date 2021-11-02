import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/app_images.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:customer_end/widgets/form_input.dart';
import 'package:customer_end/widgets/rounded_edge_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget with BaseClass{
  final FocusNode _phoneNumberNode = FocusNode();
  final  TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getCustomAppBar(context, iconColor: primaryColor),
                      Center(
                        child: Container(
                            margin: EdgeInsets.only(
                                top: Dimensions.pixels_15,
                                left: Dimensions.pixels_30),
                            child: Image(
                              image: AssetImage(supplyon_logo),
                              // width: Dimensions.pixels_80,
                              height: Dimensions.pixels_80,
                            )),
                      ),
                      SizedBox(
                        height: Dimensions.pixels_30,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: Dimensions.pixels_30),
                          width: double.infinity,
                          decoration: getScreenBackgroundDecoration(),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: Dimensions.pixels_16,
                                right: Dimensions.pixels_16,
                                top: Dimensions.pixels_30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "Forget Password",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: Dimensions.pixels_25,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.pixels_30,
                                ),
                                FormInput(
                                  label: "Phone Number",
                                  onChanged: (value) {},
                                  focusNode: _phoneNumberNode,
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: false),
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    color: primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.pixels_30,
                                ),
                                SizedBox(
                                  height: Dimensions.pixels_30,
                                ),
                                RoundedEdgeButton(
                                    height: Dimensions.pixels_56,
                                    color: primaryColor,
                                    buttonRadius: Dimensions.pixels_10,
                                    textColor: Colors.white,
                                    textFontSize: Dimensions.pixels_16,
                                    text: "Reset password",
                                    onPressed: (_) {
                                      if(_phoneNumberController.text.trim().isEmpty){
                                        showError(title: 'Phone number', message: 'Phone number cannot empty');
                                      }
                                    },
                                    context: context),
                                SizedBox(
                                  height: Dimensions.pixels_30,
                                ),

                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}