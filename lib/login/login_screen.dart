import 'package:e_commerce_task/login/login_controller.dart';
import 'package:e_commerce_task/routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Get.toNamed(RoutePath.getUsers);
              },
              child: const Text("Get users")),
          const Gap(16.0)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: loginController.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: loginController.userIdTxtCtrl,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_outline),
                    label: const Text("User name"),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 8.0),
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
              ),
              const Gap(20),
              TextFormField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: loginController.passwordTxtCtrl,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    label: const Text("Password"),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 8.0),
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
              ),
              const Gap(20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      fixedSize: const Size(double.maxFinite, 48.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  onPressed: () {
                    if (loginController.formKey.currentState!.validate()) {
                      loginController.userSignIn();
                    }
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
