import 'package:customer_end/models/login/login_model.dart';
import 'package:customer_end/services/api_service.dart';
import 'package:get/get.dart';

class GetCartBySupplierIdtController extends GetxController {
  Future<void> getCartBySupplierIdApi(
      Map<String, String> params, String supplierId) async {
    try {
      // print(params);
      final response = await ApiService.delete(
        "carts/supplier/$supplierId",
        params: params,
      );
      // print(response);
      return LoginModel.fromJson(response);
    } catch (error) {
      throw error.toString();
    }
  }
}
