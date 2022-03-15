import 'package:customer_end/models/get_branches/branches_model.dart';
import 'package:get/get.dart';

import '../../models/user_data/user_model.dart';
import '../../services/api_service.dart';
import '../user_data/get_shared_pref.dart';

class GetBranchesController extends GetxController {
  BranchesModel branchesModel;
  int _selectedIndex = -1;

  Future<void> getBranchesApi() async {
    try {
      branchesModel = null;
       _selectedIndex = -1;
      final GetSharedPref getSharedPref = Get.isRegistered<GetSharedPref>()
          ? Get.find<GetSharedPref>()
          : Get.put(GetSharedPref());
      UserDataModel userDataModel = await getSharedPref.getUserData();
      final response = await ApiService.get(
        "branches",
        headerMap: {'Authorization': 'Bearer ${userDataModel.authToken}'},
      );
      print(response);
      branchesModel = BranchesModel.fromJson(response);
      update();
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

  int get getSelectedIndex => _selectedIndex;

  void changeSelectedStatus(
    int index,
  ) {
    if (_selectedIndex != index) {
      if (_selectedIndex == -1) {
        branchesModel.data.elementAt(index).isSelected = true;
        _selectedIndex = index;
      } else {
        branchesModel.data.elementAt(_selectedIndex).isSelected = false;
        branchesModel.data.elementAt(index).isSelected = true;
        _selectedIndex = index;
      }
      update();
    }
  }



}
