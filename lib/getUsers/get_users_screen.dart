import 'package:e_commerce_task/getUsers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetUsersScreen extends StatelessWidget {
  const GetUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
        ),
        body: GetBuilder<UserController>(
            init: UserController(),
            builder: (UserController controller) {
              return controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.userList.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.userList.length,
                          itemBuilder: (context, index) => ListTile(
                                title: Text(
                                    controller.userList[index].username ?? ""),
                                subtitle: Text(
                                    controller.userList[index].password ?? ""),
                                onTap: () =>
                                    controller.sendCredintialToLogin(index),
                              ))
                      : const Center(
                          child: Text("No data"),
                        );
            }));
  }
}
