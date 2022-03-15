import 'package:customer_end/models/login/login_model.dart';
import 'package:customer_end/services/api_service.dart';
import 'package:get/get.dart';

class GetCityListController extends GetxController {


  Future<void> getCityListApi(Map<String, String> params) async {
    try {
      print(params);
      final response = await ApiService.get(
        "systemCities",

      );
      print(response);
      return LoginModel.fromJson(response);
    } catch (error) {
      throw error.toString();
    }
  }
}
