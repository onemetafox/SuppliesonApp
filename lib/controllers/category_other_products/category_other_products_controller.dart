import 'package:customer_end/models/login/login_model.dart';
import 'package:customer_end/services/api_service.dart';
import 'package:get/get.dart';

class CategoryOtherProductsController extends GetxController {


  Future<void> categoryOtherProductsApi(Map<String, String> params,String categoryId) async {
    try {
      // print(params);
      final response = await ApiService.put(
        "categories/otherProducts/$categoryId",
        params: params,
      );
      // print(response);
      return LoginModel.fromJson(response);
    } catch (error) {
      throw error.toString();
    }
  }
}
