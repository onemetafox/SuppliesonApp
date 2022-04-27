import 'package:customer_end/controllers/login/login_controller.dart';
import 'package:customer_end/controllers/user_data/get_shared_pref.dart';
import 'package:customer_end/models/login/login_model.dart';
import 'package:customer_end/models/user_data/user_model.dart';
import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/app_images.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:customer_end/views/screens/forgot_password/forgot_password_page.dart';
import 'package:customer_end/views/screens/register_step_one/sign_up_page.dart';
import 'package:customer_end/widgets/form_input.dart';
import 'package:customer_end/widgets/rounded_edge_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bottom_navigation_page.dart';

class LoginPage extends StatelessWidget with BaseClass {
  final FocusNode _phoneNumberNode = FocusNode();
  final TextEditingController _phoneNumberController = TextEditingController();
  final FocusNode _passwordNode = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  final LoginController loginController = Get.put(LoginController());
  final GetSharedPref getSharedPref = Get.put(GetSharedPref());

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
                      SizedBox(
                        height: Dimensions.pixels_56,
                      ),
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
                                    "Login",
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
                                  /*label: "Phone Number",*/
                                  label: "Email",
                                  onChanged: (value) {},
                                  controller: _phoneNumberController,
                                  focusNode: _phoneNumberNode,
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: false),
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.pixels_30,
                                ),
                                FormInput(
                                  label: "Password",
                                  onChanged: (value) {},
                                  obscureText: true,
                                  controller: _passwordController,
                                  focusNode: _passwordNode,
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.pixels_20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    pushToNextScreenWithFadeAnimation(
                                        context: context,
                                        destination: ForgotPasswordPage());
                                  },
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    padding:
                                    EdgeInsets.all(Dimensions.pixels_8),
                                    child: Text(
                                      "Forgot password?",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: Dimensions.pixels_16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
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
                                    text: "Login",
                                    onPressed: (_) async {
                                      if (_phoneNumberController.text
                                          .trim()
                                          .isEmpty) {
                                        /*showError(title: 'Phone number',
                                            message: 'Phone number cannot empty');*/
                                        showError(title: 'Email',
                                            message: 'Email cannot empty');
                                      }
                                      else if (_passwordController.text
                                          .trim()
                                          .isEmpty) {
                                        showError(title: 'Password',
                                            message: 'Password cannot empty');
                                      }
                                      else {
                                        try {
                                          showCircularDialog(context);
                                          LoginModel loginModel = await loginController
                                              .loginApi({
                                            'username': _phoneNumberController
                                                .text.trim(),
                                            'password': _passwordController.text
                                                .trim()
                                          });

                                          Get.back();
                                          UserDataModel userDataModel = UserDataModel();
                                          // print(loginModel.firstName);
                                          // print(loginModel.lastName);
                                          // print(loginModel.email);
                                          // print(loginModel.type);
                                          // print(loginModel.mobileNumber);
                                          // print(loginModel.token);
                                          // print(loginModel.language);
                                          userDataModel.isLoggedIn =true ;
                                          userDataModel.firstName = loginModel.firstName ;
                                          userDataModel.lastName = loginModel.lastName;
                                          userDataModel.authToken = loginModel.token;
                                          userDataModel.userId = loginModel.sId;
                                          userDataModel.userType = loginModel.type;
                                          userDataModel.phoneNumber = loginModel.mobileNumber;
                                          userDataModel.email = loginModel.email;
                                          userDataModel.language = loginModel.language;

                                          getSharedPref.saveSharedPreference(userDataModel);

                                          pushReplaceAndClearStack(context: context, destination: HomeBasePage());
                                          showSuccess(title: 'Success', message: 'Logged in successfully');
                                        }
                                        catch(error){
                                          Get.back();
                                          // print(error.toString());
                                          showError(title: 'Error', message: error.toString());
                                        }
                                      }

                                    },
                                    context: context),
                                SizedBox(
                                  height: Dimensions.pixels_30,
                                ),
                                RoundedEdgeButton(
                                    height: Dimensions.pixels_56,
                                    color: orange,
                                    buttonRadius: Dimensions.pixels_10,
                                    textColor: Colors.white,
                                    textFontSize: Dimensions.pixels_16,
                                    text: "Continue as a visitor",
                                    onPressed: (_) {
                                      pushToNextScreenWithFadeAnimation(
                                          context: context,
                                          destination: HomeBasePage());
                                    },
                                    context: context),
                                SizedBox(
                                  height: Dimensions.pixels_30,
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      pushToNextScreenWithFadeAnimation(
                                          context: context,
                                          destination: RegisterPage());
                                    },
                                    child: RichText(
                                      text: new TextSpan(
                                        text: 'Don\'t have an account ? ',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: Dimensions.pixels_16),
                                        children: <TextSpan>[
                                          new TextSpan(
                                              text: 'Sign Up',
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize:
                                                  Dimensions.pixels_18,
                                                  color: orange)),
                                        ],
                                      ),
                                    ),
                                  ),
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
