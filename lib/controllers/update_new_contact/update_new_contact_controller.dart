import 'package:customer_end/models/login/login_model.dart';
import 'package:customer_end/services/api_service.dart';
import 'package:get/get.dart';

class UpdateContactController extends GetxController {


  Future<void> updateContactApi(Map<String, String> params,String contactId) async {
    try {
      // print(params);
      final response = await ApiService.put(
        "contacts/$contactId",
      );
      // print(response);
      return LoginModel.fromJson(response);
    } catch (error) {
      throw error.toString();
    }
  }
}
