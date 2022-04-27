import 'package:customer_end/models/login/login_model.dart';
import 'package:customer_end/services/api_service.dart';
import 'package:get/get.dart';

class UpdateCartProductController extends GetxController {
  Future<void> updateCartProductApi(
      Map<String, String> params, String productId) async {
    try {
      // print(params);
      final response = await ApiService.put(
        "carts/product/$productId",
        params: params,
      );
      // print(response);
      return LoginModel.fromJson(response);
    } catch (error) {
      throw error.toString();
    }
  }
}
