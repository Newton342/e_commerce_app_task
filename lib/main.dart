import 'package:e_commerce_task/binding.dart';
import 'package:e_commerce_task/login/login_screen.dart';
import 'package:e_commerce_task/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(centerTitle: true)),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      getPages: RouteGenerator.routeList,
      initialBinding: HomeBindings(),
    );
  }
}
