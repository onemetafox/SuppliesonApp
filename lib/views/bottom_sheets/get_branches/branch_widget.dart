import 'package:customer_end/utils/baseClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/get_branches/get_branches_controller.dart';
import '../../../utils/app_colors.dart';

class BranchWidget extends StatefulWidget {
  @override
  State<BranchWidget> createState() => _BranchWidgetState();
}

class _BranchWidgetState extends State<BranchWidget> with BaseClass {
  final GetBranchesController _getBranchesController =
      Get.isRegistered<GetBranchesController>()
          ? Get.find<GetBranchesController>()
          : Get.put(GetBranchesController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBranchesController.getBranchesApi();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
        color: Colors.white,
      ),
      child: Padding(
          padding: EdgeInsets.all(20),
          child: GetBuilder<GetBranchesController>(
              init: _getBranchesController,
              builder: (value) {
                return value.branchesModel == null
                    ? Center(
                        child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                          darkBlue,
                        ),
                      ))
                    : Column(
                        children: [
                          Container(
                            height: 10,
                            width: 150,
                            decoration: BoxDecoration(
                                color: darkBlue.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                ...value.branchesModel.data.map((e) {
                                  return GestureDetector(
                                    onTap: () {
                                      value.changeSelectedStatus(
                                          value.branchesModel.data.indexOf(e));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(12),
                                      margin: EdgeInsets.only(bottom: 5),
                                      decoration: BoxDecoration(
                                        color: e.isSelected
                                            ? darkBlue
                                            : Colors.grey.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        e.branchName,
                                        style: TextStyle(
                                            color: e.isSelected
                                                ? white
                                                : Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print(value.getSelectedIndex);
                              if (value.getSelectedIndex == -1) {
                                showError(
                                    title: 'Branch',
                                    message: 'No branch selected');
                              }
                              else{
                                Get.back();
                              }
                            },
                            child: Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  'Select branch',
                                  style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
              })),
    );
  }
}
