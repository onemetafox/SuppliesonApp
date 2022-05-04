import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/views/bottom_sheets/get_branches/branch_widget.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../../controllers/get_branches/get_branches_controller.dart';
// import '../../../utils/app_colors.dart';

class GetBranchesBottomSheet with BaseClass{


  void getBranchesBottomSheet(BuildContext context, Function onSubmitTap) {


    showModalBottomSheet<dynamic>(
        barrierColor: Colors.black.withOpacity(0.8),
        backgroundColor: Colors.transparent,
        isScrollControlled: false,
        isDismissible: true,
        context: context,
        elevation: 15,
        builder: (BuildContext bc) {
          return BranchWidget();
        });
  }
}
