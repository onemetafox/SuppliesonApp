import 'package:customer_end/models/login/login_model.dart';
import 'package:customer_end/services/api_service.dart';
import 'package:get/get.dart';

class GetCartByCartIdController extends GetxController {
  Future<void> getCartByIdApi(Map<String, String> params, String cartId) async {
    try {
      print(params);
      final response = await ApiService.post(
        "carts/$cartId",
        params: params,
      );
      print(response);
      return LoginModel.fromJson(response);
    } catch (error) {
      throw error.toString();
    }
  }
}
