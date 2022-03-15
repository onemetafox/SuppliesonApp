import 'package:customer_end/models/suppliers_list/suppliers_list_model.dart';
import 'package:customer_end/models/user_data/user_model.dart';
import 'package:get/get.dart';

import '../../services/api_service.dart';
import '../user_data/get_shared_pref.dart';

class GetSuppliersListController extends GetxController {
  SuppliersListModel suppliersListModel;

  Future<void> getSuppliersListApi() async {
    try {
      final GetSharedPref getSharedPref = Get.isRegistered<GetSharedPref>()
          ? Get.find<GetSharedPref>()
          : Get.put(GetSharedPref());
      UserDataModel userDataModel = await getSharedPref.getUserData() ;
      final response = await ApiService.get("suppliers", headerMap: {
        'Authorization': 'Bearer ${userDataModel.authToken}'
      });
      print(response);
      suppliersListModel = SuppliersListModel.fromJson(response);
      update();
    } catch (e) {
      throw e.toString();
    }
  }
}
