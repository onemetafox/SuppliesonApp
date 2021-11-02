import 'dart:ui';

import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportsPage extends StatelessWidget with BaseClass {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        title: Text(
          'Transactions',
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.download_outlined,
                color: Colors.white,
              )),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(
                'Suppliers',
                style: GoogleFonts.roboto(
                    color: darkBlue, fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                _selectSupplierBottomSheet(context);
              },
              child: Container(
                height: 48,
                width: double.infinity,
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(border: Border.all(color: orange)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select Supplier',
                    style: GoogleFonts.roboto(
                        color: darkBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),

            Container(
              width: double.infinity,
              child: Text(
                'Transaction period',
                style: GoogleFonts.roboto(
                    color: darkBlue, fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                //_selectSupplierBottomSheet(context);
              },
              child: Container(
                height: 48,
                width: double.infinity,
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(border: Border.all(color: orange)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select Dates',
                    style: GoogleFonts.roboto(
                        color: darkBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),


            SizedBox(
              height: 25,
            ),

            Container(
              width: double.infinity,
              child: Text(
                'Branches',
                style: GoogleFonts.roboto(
                    color: darkBlue, fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                _selectBranchBottomSheet(context);
              },
              child: Container(
                height: 48,
                width: double.infinity,
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(border: Border.all(color: orange)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select branch',
                    style: GoogleFonts.roboto(
                        color: darkBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectSupplierBottomSheet(BuildContext context) {
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
                        "Select Supplier",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                            color: black),
                      ),
                    ),
                    Container(
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: Center(
                          child: Text(
                        'Supplier One',
                        style: GoogleFonts.roboto(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )),
                    ),
                    Container(
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: Center(
                          child: Text(
                        'Supplier Two',
                        style: GoogleFonts.roboto(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )),
                    ),
                    Container(
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: Center(
                          child: Text(
                        'Supplier Three',
                        style: GoogleFonts.roboto(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )),
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


  void _selectBranchBottomSheet(BuildContext context) {
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
                        "Select Branch",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                            color: black),
                      ),
                    ),
                    Container(
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: Center(
                          child: Text(
                            'Branch One',
                            style: GoogleFonts.roboto(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                    Container(
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: Center(
                          child: Text(
                            'Branch Two',
                            style: GoogleFonts.roboto(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                    Container(
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: Center(
                          child: Text(
                            'Branch Three',
                            style: GoogleFonts.roboto(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )),
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
