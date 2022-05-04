import 'package:customer_end/models/cart_list/cart_list_model.dart';
// import 'package:customer_end/models/category_list/category_list_model.dart';
// import 'package:customer_end/models/login/login_model.dart';
import 'package:customer_end/services/api_service.dart';
import 'package:get/get.dart';

import '../../models/user_data/user_model.dart';
import '../user_data/get_shared_pref.dart';

class GetCartListController extends GetxController {
  CartListModel cartListModel;

  Future<void> getCartListApi() async {
    try {
      final GetSharedPref getSharedPref = Get.isRegistered<GetSharedPref>()
          ? Get.find<GetSharedPref>()
          : Get.put(GetSharedPref());
      UserDataModel userDataModel = await getSharedPref.getUserData();
      final response = await ApiService.get(
        "carts",
        headerMap: {'Authorization': 'Bearer ${userDataModel.authToken}'},
      );
      // print(response);
      cartListModel = CartListModel.fromJson(response);
      update();
    } catch (e) {
      // print(e.toString());
      throw e.toString();
    }
  }

  Future<void> removeCartProductApi(String productId, int index) async {
    try {
      final GetSharedPref getSharedPref = Get.isRegistered<GetSharedPref>()
          ? Get.find<GetSharedPref>()
          : Get.put(GetSharedPref());
      UserDataModel userDataModel = await getSharedPref.getUserData();
      // final response = await ApiService.delete("carts/product/$productId", headerMap: {'Authorization': 'Bearer ${userDataModel.authToken}'});
      await ApiService.delete("carts/product/$productId", headerMap: {'Authorization': 'Bearer ${userDataModel.authToken}'});
      // print(response);
      cartListModel.data.elementAt(0).cart.products.removeAt(index);
      update();
    } catch (error) {
      throw error.toString();
    }
  }

  Future<void> changeProductCount(
      String productId, int index, int count) async {
    try {
      final GetSharedPref getSharedPref = Get.isRegistered<GetSharedPref>()
          ? Get.find<GetSharedPref>()
          : Get.put(GetSharedPref());
      UserDataModel userDataModel = await getSharedPref.getUserData();
      // final response = await ApiService.put("carts/product/$productId?quantity=$count", headerMap: {'Authorization': 'Bearer ${userDataModel.authToken}'});
      await ApiService.put("carts/product/$productId?quantity=$count", headerMap: {'Authorization': 'Bearer ${userDataModel.authToken}'});
      // print(response);
      cartListModel.data.elementAt(0).cart.products.removeAt(index);
      update();
    } catch (error) {
      throw error.toString();
    }
  }
}
