import 'dart:ui';

import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/widgets/form_input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StaffPage extends StatelessWidget with BaseClass {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        title: Text('Staff'),
        centerTitle: true,
        actions: [

          IconButton(
            onPressed: () {
              _filterBottomSheet(context);
            },
            icon: Icon(Icons.filter_alt),
            color: Colors.white,
          ),

          IconButton(
            onPressed: () {
              _updateUserData(context,false);

            },
            icon: Icon(Icons.add_circle_sharp),
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Users',
                style: GoogleFonts.roboto(
                    color: darkBlue, fontSize: 20, fontWeight: FontWeight.w700),
              ),
              ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 3.0, // soften the shadow
                            spreadRadius: 3.0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 0  horizontally
                              0.5, // Move to bottom 0.5 Vertically
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                  child: Text('Name'),
                                  width: double.infinity,
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  width: double.infinity,
                                  child: Text(
                                    'Mohammed',
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.roboto(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                  child: Text('Role'),
                                  width: double.infinity,
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  width: double.infinity,
                                  child: Text(
                                    'Area Manager',
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.roboto(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                  child: Text('Email'),
                                  width: double.infinity,
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  width: double.infinity,
                                  child: Text(
                                    'm.ali@dosecafeksa.com',
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.roboto(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                  child: Text('Status'),
                                  width: double.infinity,
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  width: double.infinity,
                                  child: Text(
                                    'Active',
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.roboto(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _updateUserData(context,true);
                                  },
                                  child: Container(
                                    height: 48,
                                    child: Center(
                                      child: Text(
                                        'Edit',
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: darkBlue,
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _resetPassword(context);
                                  },
                                  child: Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                        color: orange,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                        'Settings',
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  void _updateUserData(BuildContext context,bool isUpdate) {
    showModalBottomSheet<dynamic>(
        barrierColor: hintGrey.withOpacity(0.3),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        isDismissible: true,
        context: context,
        elevation: 15,
        builder: (BuildContext bc) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0)),
                color: bottomSheetBackground,
              ),
              padding: EdgeInsets.only(top: 20.0),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: new Wrap(
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 5,
                        width: 50,
                        color: hintGrey,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 19, top: 10),
                      child: Text(
                        "Update User",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                            color: black),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: FormInput(
                                label: 'First Name',
                                onChanged: (value) {},
                                focusNode: FocusNode()),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: FormInput(
                                label: 'Last Name',
                                onChanged: (value) {},
                                focusNode: FocusNode()),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: FormInput(
                                label: 'Phone Number',
                                onChanged: (value) {},
                                focusNode: FocusNode()),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: FormInput(
                                label: 'Email',
                                onChanged: (value) {},
                                focusNode: FocusNode()),
                          ),
                        ],
                      ),
                    ),
                 isUpdate? Container():  Container(
                      margin:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: FormInput(
                                label: 'Password',
                                obscureText: true,
                                onChanged: (value) {},
                                focusNode: FocusNode()),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: FormInput(
                                label: 'Confirm Password',
                                onChanged: (value) {},
                                obscureText: true,
                                focusNode: FocusNode()),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: FormInput(
                                label: 'Role',
                                onChanged: (value) {},
                                focusNode: FocusNode()),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: FormInput(
                                label: 'Status',
                                onChanged: (value) {},
                                focusNode: FocusNode()),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        removeFocusFromEditText(context: context);
                      },
                      child: Container(
                        height: 48,
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            top: 35.0, bottom: 30, left: 16, right: 16),
                        decoration: BoxDecoration(
                            color: orange,
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: Text(
                            "UPDATE",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _resetPassword(BuildContext context) {
    showModalBottomSheet<dynamic>(
        barrierColor: hintGrey.withOpacity(0.3),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        isDismissible: true,
        context: context,
        elevation: 15,
        builder: (BuildContext bc) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0)),
                color: bottomSheetBackground,
              ),
              padding: EdgeInsets.only(top: 20.0),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: new Wrap(
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 5,
                        width: 50,
                        color: hintGrey,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 19, top: 10),
                      child: Text(
                        "Reset Password",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                            color: black),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: FormInput(
                          label: 'NEW PASSWORD',
                          onChanged: (value) {},
                          obscureText: true,
                          focusNode: FocusNode()),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: FormInput(
                          label: 'CONFIRM PASSWORD',
                          onChanged: (value) {},
                          obscureText: true,
                          focusNode: FocusNode()),
                    ),
                    GestureDetector(
                      onTap: () {
                        removeFocusFromEditText(context: context);
                      },
                      child: Container(
                        height: 48,
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            top: 35.0, bottom: 30, left: 16, right: 16),
                        decoration: BoxDecoration(
                            color: orange,
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: Text(
                            "UPDATE",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _filterBottomSheet(BuildContext context) {
    showModalBottomSheet<dynamic>(
        barrierColor: hintGrey.withOpacity(0.3),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        isDismissible: true,
        context: context,
        elevation: 15,
        builder: (BuildContext bc) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0)),
                color: bottomSheetBackground,
              ),
              padding: EdgeInsets.only(top: 20.0),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: new Wrap(
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 5,
                        width: 50,
                        color: hintGrey,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 19, top: 10),
                      child: Text(
                        "Filter",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                            color: black),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: FormInput(
                          label: 'SEARCH BY NAME OR EMAIL',
                          onChanged: (value) {},
                          focusNode: FocusNode()),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: FormInput(
                          label: 'STATUS',
                          onChanged: (value) {},
                          focusNode: FocusNode()),
                    ),

                    Container(
                      margin:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: FormInput(
                          label: 'SELECT ROLE',
                          onChanged: (value) {},
                          focusNode: FocusNode()),
                    ),
                    GestureDetector(
                      onTap: () {
                        removeFocusFromEditText(context: context);
                      },
                      child: Container(
                        height: 48,
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            top: 35.0, bottom: 30, left: 16, right: 16),
                        decoration: BoxDecoration(
                            color: orange,
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: Text(
                            "UPDATE",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
