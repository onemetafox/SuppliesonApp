
import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/views/screens/branch/branch_page.dart';
import 'package:customer_end/views/screens/roles_permission/roles_permission_page.dart';
import 'package:customer_end/views/screens/staff/staff_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatelessWidget with BaseClass {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        title: Text('Account'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      pushToNextScreenWithAnimation(
                          context: context, destination: StaffPage());
                    },
                    child: Container(
                      height: 130,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [orange, darkBlue],
                            begin: FractionalOffset(0, 0),
                            end: FractionalOffset(0, 1),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Staff',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      pushToNextScreenWithAnimation(
                          context: context, destination: BranchesPage());
                    },
                    child: Container(
                      height: 130,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [orange, darkBlue],
                            begin: FractionalOffset(0, 0),
                            end: FractionalOffset(0, 1),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Branches',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      pushToNextScreenWithAnimation(
                        context: context,
                        destination: RolesPermissionPage(),
                      );
                    },
                    child: Container(
                      height: 130,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [orange, darkBlue],
                            begin: FractionalOffset(0, 0),
                            end: FractionalOffset(0, 1),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Roles & Permission',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 20,
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
      ),
    );
  }
}
