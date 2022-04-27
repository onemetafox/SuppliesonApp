import 'package:customer_end/models/login/login_model.dart';
import 'package:customer_end/models/product_list/product_list_model.dart';
import 'package:customer_end/services/api_service.dart';
import 'package:get/get.dart';

import '../../models/category_list/category_list_model.dart';
import '../../models/user_data/user_model.dart';
import '../user_data/get_shared_pref.dart';

class ProductsAsPerCategoryController extends GetxController {
  ProductListModel productListModel;

  Future<void> getProducts(String supplierId, String categoryId) async {
    try {
      final GetSharedPref getSharedPref = Get.isRegistered<GetSharedPref>()
          ? Get.find<GetSharedPref>()
          : Get.put(GetSharedPref());
      UserDataModel userDataModel = await getSharedPref.getUserData();
      final response = await ApiService.get(
          "categories/products/$categoryId?skip=0&limit=9&supplierId=$supplierId",
          headerMap: {'Authorization': 'Bearer ${userDataModel.authToken}'});
      // print(response);
      productListModel = ProductListModel.fromJson(response);
      update();
    } catch (e) {
      throw e.toString();
    }
  }
}
