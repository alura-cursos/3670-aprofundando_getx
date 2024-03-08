import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vidflow/screens/dashboard.dart';
import 'package:vidflow/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:vidflow/utils/snackbars.dart';

class RegisterController extends GetxController {

  final TextEditingController textUserController = TextEditingController();
  final TextEditingController textEmailController = TextEditingController();
  final TextEditingController textPasswordController = TextEditingController();

  Future<void> register() async {
    try {
      Map<String, String> headers = {"Content-Type": "application/json"};
      Uri uri = Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.register);
      Map<String, String> body = {
        "user": textUserController.text,
        "email": textEmailController.text,
        "password": textPasswordController.text
      };
      http.Response response = await http.post(uri, headers: headers, body: jsonEncode(body));
      if(response.statusCode == 201) {
        final json = jsonDecode(response.body);
        print(json);
        textUserController.clear();
        textEmailController.clear();
        textPasswordController.clear();
        AppSnacks.getConfirmRegistration(true);
      } else {
        AppSnacks.getConfirmRegistration(false);
        throw jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> login() async {
    try {
      Map<String, String> headers = {"Content-Type": "application/json"};
      Uri uri = Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.login);
      Map<String, String> body = {
        "email": textEmailController.text,
        "password": textPasswordController.text
      };
      http.Response response = await http.post(uri, headers: headers, body: jsonEncode(body));
      if(response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        GetStorage().write("session", json);
        Get.to(() => Dashboard());
      } else {
        AppSnacks.getErrorLogin();
        throw jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}