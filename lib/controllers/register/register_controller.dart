// import 'dart:convert';

import 'package:customer_end/services/api_service.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> registerApi(Map<String, String> params) async {
    try {
      // print(params);
      // final response = await ApiService.postWithQueryParameter("suppliers", params: params);
      await ApiService.postWithQueryParameter("suppliers", params: params);

    } catch (error) {
      // print(error);
      throw error.toString();
    }
  }
}