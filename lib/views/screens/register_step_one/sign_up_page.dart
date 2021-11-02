
import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/app_strings.dart';
import 'package:customer_end/utils/app_validator.dart';

import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:customer_end/views/screens/register_step_two/regiter_step_two.dart';
import 'package:customer_end/widgets/form_input.dart';
import 'package:customer_end/widgets/rounded_edge_button.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget with BaseClass {
  final FocusNode _phoneNumberNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _lastNameNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _fullName = FocusNode();
  final FocusNode _confirmPassword = FocusNode();

  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final bool isTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: darkBlue,
          title: Text('Sign up'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
                          "Account Info",
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
                        label: "Full Name*",
                        onChanged: (value) {},
                        focusNode: _fullName,
                        controller: _fullNameController,
                        prefixIcon: Icon(
                          Icons.person,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.pixels_30,
                      ),
                      FormInput(
                        label: "Last Name*",
                        onChanged: (value) {},
                        controller:  _lastNameController,
                        focusNode: _lastNameNode,
                        prefixIcon: Icon(
                          Icons.person,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.pixels_30,
                      ),
                      FormInput(
                        label: "Email*",
                        onChanged: (value) {},
                        focusNode: _emailNode,
                        controller:  _emailController,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.pixels_30,
                      ),
                      FormInput(
                        label: "Mobile*",
                        onChanged: (value) {},
                        controller:  _phoneNumberController,
                        focusNode: _phoneNumberNode,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.pixels_30,
                      ),
                      FormInput(
                        label: "Password",
                        onChanged: (value) {},
                        controller:  _passwordController,
                        obscureText: true,
                        focusNode: _passwordNode,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.pixels_30,
                      ),
                      FormInput(
                        label: "Confirm password",
                        onChanged: (value) {},
                        controller:  _confirmPasswordController,
                        obscureText: true,
                        focusNode: _confirmPassword,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: primaryColor,
                        ),
                      ),
                    /*  Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.all(Dimensions.pixels_8),
                        child: Row(
                          children: [
                            Checkbox(
                                value: isTerms,
                                activeColor: orange,
                                hoverColor: orange,
                                checkColor: primaryColor,
                                onChanged: (bool value) {
                                  setState(() {
                                    isTerms = value;
                                  });
                                }),
                            Text(
                              "I accept the ",
                              style: TextStyle(color: primaryColor),
                            ),
                            Text(
                              "Terms and Conditions",
                              style: TextStyle(color: primaryColor),
                            ),
                          ],
                        ),
                      ),*/
                      SizedBox(
                        height: Dimensions.pixels_20,
                      ),
                      RoundedEdgeButton(
                          height: Dimensions.pixels_56,
                          color: primaryColor,
                          buttonRadius: Dimensions.pixels_10,
                          textColor: Colors.white,
                          textFontSize: Dimensions.pixels_16,
                          text: "NEXT",
                          onPressed: (_) {
                            if (AppValidator.isEmptyValidate(
                                _fullNameController.text.trim())) {
                              showError(
                                  title: AppStrings.ERROR, message: AppStrings.NAME_ERROR);
                            }
                           else if (AppValidator.isEmptyValidate(
                                _lastNameController.text.trim())) {
                              showError(
                                  title: AppStrings.ERROR, message: AppStrings.LAST_NAME_ERROR);
                            }
                            else if (AppValidator.isEmptyValidate(
                                _emailController.text.trim())) {
                              showError(
                                title: AppStrings.ERROR,
                                message: AppStrings.EMAIL_ERROR,
                              );
                            } else if (!AppValidator.isValidEmail(
                                _emailController.text.trim())) {
                              showError(
                                  title: AppStrings.ERROR,
                                  message: AppStrings.EMAIL_FORMAT_ERROR);
                            }
                            else if (AppValidator.isEmptyValidate(
                                _phoneNumberController.text.trim())) {
                              showError(
                                title: AppStrings.ERROR,
                                message: AppStrings.MOBILE_ERROR,
                              );
                            }

                            else if (AppValidator.isEmptyValidate(
                                _passwordController.text.trim())) {
                              showError(
                                  title: AppStrings.ERROR,
                                  message: AppStrings.PASSWORD_ERROR);
                            } else if (AppValidator.isEmptyValidate(
                                _confirmPasswordController.text.trim())) {
                              showError(
                                  title: AppStrings.ERROR,
                                  message: AppStrings.CONFIRM_PASSWORD_ERROR);
                            } else if (!AppValidator.isStringMatches(
                                _passwordController.text.trim(),
                                _confirmPasswordController.text.trim())) {
                              showError(
                                  title: AppStrings.ERROR,
                                  message: AppStrings.PASSWORD_CONFIRMATION_ERROR);
                            }
                            pushToNextScreen(context: context, destination: RegisterStepTwo());
                          },
                          context: context),
                      SizedBox(
                        height: Dimensions.pixels_30,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
