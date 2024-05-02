import 'dart:convert';

import 'package:e_commerce_task/apis.dart';
import 'package:e_commerce_task/http_services.dart';
import 'package:e_commerce_task/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController userIdTxtCtrl = TextEditingController();
  TextEditingController passwordTxtCtrl = TextEditingController();
  int? userId;

  final formKey = GlobalKey<FormState>();
  @override
  void onClose() {
    super.onClose();
    userIdTxtCtrl.dispose();
    passwordTxtCtrl.dispose();
  }

  void userSignIn() async {
    try {
      var response = await HTTPServices.postData(APIs.authAndLogin,
          parameters: {
            "username": userIdTxtCtrl.text,
            "password": passwordTxtCtrl.text
          });
      if (response.statusCode == 200) {
        var userToken = jsonDecode(response.body);
        if (userToken['token'] != null) {
          Get.offAllNamed(RoutePath.home);
        }
      } else {
        Get.snackbar("Invalid", response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  // void getToken(String token) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('token', token);
  // }
}
