import 'package:customer_end/models/login/login_model.dart';
import 'package:customer_end/services/api_service.dart';
import 'package:get/get.dart';

class UpdateCityController extends GetxController {
  Future<void> updateCityApi(Map<String, String> params, String cityId) async {
    try {
      print(params);
      final response = await ApiService.put(
        "systemCities/$cityId",
      );
      print(response);
      return LoginModel.fromJson(response);
    } catch (error) {
      throw error.toString();
    }
  }
}
