import 'dart:io';

import 'package:customer_end/controllers/register/register_controller.dart';
import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/app_images.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:customer_end/views/bottom_sheets/custom_date_picker/custom_cupertimo_date_picker.dart';
import 'package:customer_end/widgets/form_input.dart';
import 'package:customer_end/widgets/rounded_edge_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class RegisterStepTwo extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String mobileNumber;
  final String password;
  final String confirmPassword;

  RegisterStepTwo({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.mobileNumber,
    @required this.password,
    @required this.confirmPassword,
  });

  @override
  _RegisterStepTwoState createState() => _RegisterStepTwoState();
}

class _RegisterStepTwoState extends State<RegisterStepTwo> with BaseClass {
  FocusNode _phoneNumberNode = FocusNode();
  FocusNode _emailNode = FocusNode();
  FocusNode _lastNameNode = FocusNode();
  FocusNode _passwordNode = FocusNode();
  FocusNode _confirmPassword = FocusNode();
  FocusNode _fullName = FocusNode();
  String _selectedData ='';
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _commercialRegisterNumberController =
  TextEditingController();
  TextEditingController _vatController = TextEditingController();
  bool isTerms = false;
  final picker = ImagePicker();
  File _vatImage;
  File _crImage;
  RegisterController registerController = Get.put(RegisterController());

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
                          "Company Info",
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
                        label: "Company Name*",
                        onChanged: (value) {},
                        focusNode: _fullName,
                        controller: _companyNameController,
                        prefixIcon: Icon(
                          Icons.house_outlined,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.pixels_30,
                      ),
                      FormInput(
                        label: "COMMERCIAL REGISTER NUMBER*",
                        onChanged: (value) {},
                        controller: _commercialRegisterNumberController,
                        focusNode: _lastNameNode,
                        maxTextFieldLength: 10,
                        keyboardType:
                        TextInputType.numberWithOptions(decimal: false),
                        prefixIcon: Icon(
                          Icons.confirmation_number_outlined,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.pixels_30,
                      ),
                      InkWell(
                        onTap: () {
                          ShowCustomDatePicker().showDatePicker(context, (val) {
                            print(val.toString());
                            _selectedData = val.toString() ;
                            setState(() {

                            });
                          }, (val) {
                            _selectedData = val.toString() ;
                            setState(() {

                            });
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Select Date*',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.pixels_16),
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.pixels_5,
                            ),
                            Container(
                              height: 51,
                              width: double.infinity,
                              padding: EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.2),
                                borderRadius:
                                BorderRadius.circular(Dimensions.pixels_10),
                              ),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(_selectedData,
                                    style: GoogleFonts.roboto(color: darkBlue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.pixels_30,
                      ),
                      FormInput(
                        label: "VAT REGISTER NUMBER*",
                        onChanged: (value) {},
                        focusNode: _phoneNumberNode,
                        controller: _vatController,
                        keyboardType:
                        TextInputType.numberWithOptions(decimal: false),
                        prefixIcon: Icon(
                          Icons.vertical_align_top_sharp,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.pixels_30,
                      ),
                      Text(
                        'Select date',
                        style: GoogleFonts.roboto(
                            color: darkBlue,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: Dimensions.pixels_30,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'C.R PHOTO*',
                                  style: GoogleFonts.roboto(
                                      color: darkBlue,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _showUploadImageActionSheet(context, false);
                                  },
                                  child: _crImage == null
                                      ? Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: darkBlue),
                                    ),
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(image),
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                  )
                                      : Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: darkBlue),
                                    ),
                                    child: Center(
                                      child: Image(
                                        image: FileImage(_crImage),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'VAT PHOTO*',
                                  style: GoogleFonts.roboto(
                                      color: darkBlue,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _showUploadImageActionSheet(context, true);
                                  },
                                  child: _vatImage == null
                                      ? Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: darkBlue),
                                    ),
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(image),
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                  )
                                      : Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: darkBlue),
                                    ),
                                    child: Center(
                                      child: Image(
                                        image: FileImage(_vatImage),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                        ],
                      ),
                      Container(
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
                      ),
                      SizedBox(
                        height: Dimensions.pixels_10,
                      ),
                      RoundedEdgeButton(
                          height: Dimensions.pixels_56,
                          color: primaryColor,
                          buttonRadius: Dimensions.pixels_10,
                          textColor: Colors.white,
                          textFontSize: Dimensions.pixels_16,
                          text: "SIGN UP",
                          onPressed: (_) async{
                            if (_companyNameController.text
                                .trim()
                                .isEmpty) {
                              showError(
                                  title: 'Company name',
                                  message: 'Company name cannot be empty');
                            } else if (_commercialRegisterNumberController.text
                                .trim()
                                .isEmpty) {
                              showError(
                                  title: 'Commercial register number ',
                                  message:
                                  'Commercial register number cannot be empty');
                            } else if (_vatController.text
                                .trim()
                                .isEmpty) {
                              showError(
                                  title: 'VAT', message: 'VAT cannot be empty');
                            } else if (_crImage == null) {
                              showError(
                                  title: 'CR PHOTO',
                                  message: 'Please upload CR PHOTO');
                            } else if (_vatImage == null) {
                              showError(
                                  title: 'VAT PHOTO',
                                  message: 'Please upload VAT PHOTO');
                            } else if (!isTerms) {
                              showError(
                                  title: 'Terms and Conditions',
                                  message:
                                  'Please agree to terms and conditions');
                            } else if (_commercialRegisterNumberController.text
                                .trim()
                                .length !=
                                10) {
                              showError(
                                  title: 'Commercial register number',
                                  message:
                                  'Commercial register number must be of 10 digits');
                            } else {
                              try {
                                showCircularDialog(context);
                               await registerController.registerApi({
                                  "VATRegisterNumber":
                                  _vatController.text.trim(),
                                  "VATRegisterPhoto":
                                  "https://supplieson.com/api/upload/image/470959861eeaf63de14704f2905026d4",
                                  "commercialRegister":
                                  _commercialRegisterNumberController.text
                                      .trim(),
                                  "commercialRegisterExpireDate": "2021-11-30",
                                  "commercialRegisterExpireDateIslamic":
                                  "2022-11-05T08:00:00.000Z",
                                  "commercialRegisterPhoto":
                                  "https://supplieson.com/api/upload/image/d9d145391a998006f495605d37880976",
                                  "confirmPassword": widget.confirmPassword,
                                  "language": "en",
                                  "representativeName":
                                  _companyNameController.text.trim(),
                                  "userEmail": widget.email,
                                  "userFirstName": widget.firstName,
                                  "userLastName": widget.lastName,
                                  "userMobilePhone":
                                  "9665${widget.mobileNumber}",
                                  "userPassword": widget.password
                                });
                               Get.back();
                               Get.back();
                                Get.back();
                                showSuccess(title: 'Success', message: 'Registered successfully');
                              } catch (e) {
                                Get.back();
                                showError(
                                    title: 'Error', message: e.toString());
                              }
                            }
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

  _showUploadImageActionSheet(BuildContext context, bool isVatPic) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) =>
          CupertinoActionSheet(
            title: Text('Choose Options',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: orange)),
            message: Text('Your options are'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text('Camera'),
                onPressed: () {
                  Get.back();
                  isVatPic ? getVatImage(true) : getCrImage(true);
                },
              ),
              CupertinoActionSheetAction(
                child: Text('Choose from Gallery'),
                onPressed: () {
                  Get.back();
                  isVatPic ? getVatImage(false) : getCrImage(false);
                },
              )
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text('Cancel'),
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context, 'Cancel');
              },
            ),
          ),
    );
  }

  Future getVatImage(bool isCamera) async {
    final pickedFile = await picker.getImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        if (_vatImage == null) {
          _vatImage = File(pickedFile.path);
        } else {
          _vatImage = File(pickedFile.path);
        }
        setState(() {});
      } else {
        print('No image selected.');
      }
    });
  }

  Future getCrImage(bool isCamera) async {
    final pickedFile = await picker.getImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        if (_crImage == null) {
          _crImage = File(pickedFile.path);
        } else {
          _crImage = File(pickedFile.path);
        }
        setState(() {});
      } else {
        print('No image selected.');
      }
    });
  }
}
