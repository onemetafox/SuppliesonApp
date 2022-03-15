import 'package:customer_end/models/login/login_model.dart';
import 'package:customer_end/services/api_service.dart';
import 'package:get/get.dart';

class DeleteCategoryController extends GetxController {


  Future<void> deleteCategoryApi(Map<String, String> params,String categoryId) async {
    try {
      print(params);
      final response = await ApiService.delete(
        "categories/$categoryId",
        params: params,
      );
      print(response);
      return LoginModel.fromJson(response);
    } catch (error) {
      throw error.toString();
    }
  }
}
