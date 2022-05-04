// import 'package:customer_end/models/login/login_model.dart';
import 'package:customer_end/services/api_service.dart';
import 'package:get/get.dart';

import '../../models/category_list/category_list_model.dart';
import '../../models/user_data/user_model.dart';
import '../user_data/get_shared_pref.dart';

class GetCategoryListController extends GetxController {

  CategoryListModel categoryListModel;

  Future<void> getCartListApi(String supplierId) async {
    try {
      final GetSharedPref getSharedPref = Get.isRegistered<GetSharedPref>()
          ? Get.find<GetSharedPref>()
          : Get.put(GetSharedPref());
      UserDataModel userDataModel = await getSharedPref.getUserData();
      final response = await ApiService.get("categories?skip=0&limit=10&supplierId=$supplierId&all=false", headerMap: {
        'Authorization': 'Bearer ${userDataModel.authToken}'
      });
      // print(response);
      categoryListModel = CategoryListModel.fromJson(response);
      update();
    } catch (e) {
      throw e.toString();
    }
  }
}
