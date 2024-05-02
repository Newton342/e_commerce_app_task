import 'dart:convert';

import 'package:e_commerce_task/apis.dart';
import 'package:e_commerce_task/getUsers/users_model.dart';
import 'package:e_commerce_task/http_services.dart';
import 'package:e_commerce_task/login/login_controller.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  List<UsersModel> userList = [];
  bool isLoading = false;
  set _isLoadingState(bool value) {
    isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    _isLoadingState = true;
    var response = await HTTPServices.getData(APIs.users);
    if (response.statusCode == 200) {
      List decodedData = jsonDecode(response.body);
      userList =
          decodedData.map<UsersModel>((e) => UsersModel.fromJson(e)).toList();
    }
    _isLoadingState = false;
  }

  void sendCredintialToLogin(int index) {
    final loginCtrl = Get.find<LoginController>();
    // Get.offAllNamed(RoutePath.login, parameters: {
    //   "userId": userList[index].username ?? "",
    //   "password": userList[index].password ?? ""
    // });
    Get.back();
    loginCtrl.passwordTxtCtrl.text = userList[index].password ?? "";
    loginCtrl.userIdTxtCtrl.text = userList[index].username ?? "";
    loginCtrl.userId = userList[index].id;
  }
}
