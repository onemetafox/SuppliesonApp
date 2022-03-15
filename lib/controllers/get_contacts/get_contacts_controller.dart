import 'package:customer_end/models/login/login_model.dart';
import 'package:customer_end/services/api_service.dart';
import 'package:get/get.dart';

class GetContactListController extends GetxController {


  Future<void> getContactListApi(Map<String, String> params,String contactId) async {
    try {
      print(params);
      final response = await ApiService.get(
        "contacts",
      );
      print(response);
      return LoginModel.fromJson(response);
    } catch (error) {
      throw error.toString();
    }
  }
}
