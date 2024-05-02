import 'package:e_commerce_task/getUsers/get_users_screen.dart';
import 'package:e_commerce_task/home/home_screen.dart';
import 'package:e_commerce_task/login/login_screen.dart';
import 'package:e_commerce_task/product/product_screen.dart';
import 'package:e_commerce_task/productList/products_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RoutePath {
  static const getUsers = '/getUsers';
  static const login = '/login';
  static const productList = '/productList';
  static const home = '/home';
  static const product = '/product';
}

class RouteGenerator {
  static final List<GetPage> routeList = [
    GetPage(
      name: RoutePath.getUsers,
      page: () => const GetUsersScreen(),
    ),
    GetPage(
      name: RoutePath.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: RoutePath.productList,
      page: () => const ProductListScreen(),
    ),
    GetPage(
      name: RoutePath.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: RoutePath.product,
      page: () => const ProductScreen(),
    )
  ];
}
