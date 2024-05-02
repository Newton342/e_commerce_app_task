import 'dart:convert';

import 'package:e_commerce_task/apis.dart';
import 'package:e_commerce_task/http_services.dart';
import 'package:e_commerce_task/productList/products_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  bool isLoading = false;
  List<ProductModel> _productList = [];
  List<ProductModel> foundproductList = [];
  List<String> categories = [];
  set _isLoadingState(bool value) {
    isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    fetchCategories();
  }

  void fetchProducts() async {
    _isLoadingState = true;
    try {
      var response = await HTTPServices.getData(APIs.products);
      if (response.statusCode == 200) {
        List decodedData = jsonDecode(response.body);

        _productList = decodedData
            .map<ProductModel>(
              (e) => ProductModel.fromJson(e),
            )
            .toList();
        foundproductList = _productList;
        // print(decodedData);
      }
      _isLoadingState = false;
    } catch (e) {
      Get.snackbar("Opps!", e.toString());
    }
  }

  void fetchCategories() async {
    try {
      var response =
          await HTTPServices.getData(APIs.products + APIs.categories);
      if (response.statusCode == 200) {
        List decodedData = jsonDecode(response.body);
        categories = decodedData.map<String>((e) => e.toString()).toList();
        categories.addAll(["none", "desc"]);
      }
    } catch (e) {
      print(e);
    }
  }

  void fetchProductsByCategories(String value) async {
    _isLoadingState = true;
    try {
      var response =
          await HTTPServices.getData("${APIs.products}${APIs.category}/$value");
      if (response.statusCode == 200) {
        List decodedData = jsonDecode(response.body);

        _productList = decodedData
            .map<ProductModel>(
              (e) => ProductModel.fromJson(e),
            )
            .toList();
        foundproductList = _productList;
      }
      _isLoadingState = false;
    } catch (e) {
      Get.snackbar("Opps!", e.toString());
    }
  }

  void searchProduct(String keyword) {
    if (keyword.isNotEmpty) {
      foundproductList = _productList
          .where((product) => product.title!.toLowerCase().contains(keyword))
          .toList();
    } else {
      foundproductList = _productList;
    }
    update();
  }

  void sortProduct(String value) async {
    if (value == "none") {
      fetchProducts();
    } else if (value == "desc") {
      _isLoadingState = true;
      try {
        var response = await HTTPServices.getData(APIs.products,
            parameters: {"sort": "desc"});
        if (response.statusCode == 200) {
          List decodedData = jsonDecode(response.body);

          _productList = decodedData
              .map<ProductModel>(
                (e) => ProductModel.fromJson(e),
              )
              .toList();
          foundproductList = _productList;
          // print(decodedData);
        }
        _isLoadingState = false;
      } catch (e) {
        Get.snackbar("Opps!", e.toString());
      }
    } else {
      fetchProductsByCategories(value);
    }
  }
}
