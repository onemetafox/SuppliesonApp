// import 'package:customer_end/models/login/login_model.dart';
import 'package:customer_end/services/api_service.dart';
import 'package:get/get.dart';

import '../../models/user_data/user_model.dart';
import '../user_data/get_shared_pref.dart';

class CheckOutCartController extends GetxController {
  Future<void> checkoutCartApi(String cartId, String branchId) async {
    try {
      final GetSharedPref getSharedPref = Get.isRegistered<GetSharedPref>()
          ? Get.find<GetSharedPref>()
          : Get.put(GetSharedPref());
      UserDataModel userDataModel = await getSharedPref.getUserData();
      // print(cartId);
      // print(branchId);
      // print('Bearer ${userDataModel.authToken}');
      // final response = await ApiService.postWithQueryParameter("carts/checkout/$cartId?branchId=$branchId", headerMap: {'Authorization': 'Bearer ${userDataModel.authToken}'});
      await ApiService.postWithQueryParameter("carts/checkout/$cartId?branchId=$branchId", headerMap: {'Authorization': 'Bearer ${userDataModel.authToken}'});
      // print(response);
    } catch (error) {
      // print(error.toString());
      throw error.toString();
    }
  }
}
