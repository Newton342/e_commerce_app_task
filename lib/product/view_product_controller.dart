import 'package:get/get.dart';

class ViewProductController extends GetxController {
  late String title;
  late String description;
  late String price;
  late String rating;
  late String image;
  @override
  void onInit() {
    super.onInit();
    title = Get.parameters['title'] ?? "";
    description = Get.parameters['desc'] ?? "";
    price = Get.parameters['price'] ?? "";
    rating = Get.parameters['rate'] ?? "";
    image = Get.parameters['image'] ?? "";
  }
}
