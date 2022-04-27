import 'package:customer_end/models/get_orders/get_orders_model.dart';
import 'package:customer_end/models/login/login_model.dart';
import 'package:customer_end/services/api_service.dart';
import 'package:get/get.dart';

import '../../models/category_list/category_list_model.dart';
import '../../models/user_data/user_model.dart';
import 'user_data/get_shared_pref.dart';


class GetOrdersController extends GetxController {

  GetOrdersModel getOrdersModel;

  Future<void> getOrderListApi(/*String supplierId*/) async {
    try {
      final GetSharedPref getSharedPref = Get.isRegistered<GetSharedPref>()
          ? Get.find<GetSharedPref>()
          : Get.put(GetSharedPref());
      UserDataModel userDataModel = await getSharedPref.getUserData();
      final response = await ApiService.get("orders?skip=0&limit=30&supplierId=5f1a9c45cce33f65397fa7eb", headerMap: {
        'Authorization': 'Bearer ${userDataModel.authToken}'
      });
      // print(response);
      getOrdersModel = GetOrdersModel.fromJson(response);
      update();
    } catch (e) {
      throw e.toString();
    }
  }
}
