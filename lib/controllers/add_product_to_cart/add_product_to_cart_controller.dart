// import 'package:customer_end/models/login/login_model.dart';
import 'package:customer_end/services/api_service.dart';
import 'package:get/get.dart';

import '../../models/user_data/user_model.dart';
import '../user_data/get_shared_pref.dart';

class AddProductToCartController extends GetxController {
  Future<void> addProductToCartApi(Map<String, String> params) async {
    try {
      // print(params);
      final GetSharedPref getSharedPref = Get.isRegistered<GetSharedPref>()
          ? Get.find<GetSharedPref>()
          : Get.put(GetSharedPref());
      UserDataModel userDataModel = await getSharedPref.getUserData();
      // final response = await ApiService.post("carts", params: params, headerMap: {'Authorization': 'Bearer ${userDataModel.authToken}'});
      await ApiService.post("carts", params: params, headerMap: {'Authorization': 'Bearer ${userDataModel.authToken}'});
      // print(response);
      update();
      //  return LoginModel.fromJson(response);
    } catch (error) {
      throw error.toString();
    }
  }
}
