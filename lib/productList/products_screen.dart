import 'package:e_commerce_task/productList/product_controller.dart';
import 'package:e_commerce_task/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        init: ProductController(),
        builder: (ProductController controller) {
          return Scaffold(
            appBar: AppBar(
              leading: PopupMenuButton(
                itemBuilder: (context) => controller.categories
                    .map<PopupMenuEntry<String>>((String e) => PopupMenuItem(
                          child: Text(e),
                          onTap: () {
                            controller.sortProduct(e);
                          },
                        ))
                    .toList(),
              ),
              title: TextField(
                onChanged: (value) => controller.searchProduct(value),
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                    hintText: 'Search',
                    contentPadding: const EdgeInsets.all(10.0),
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            body: controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.foundproductList.isNotEmpty
                    ? GridView.builder(
                        padding: const EdgeInsets.all(16.0),
                        itemCount: controller.foundproductList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                crossAxisCount: 2),
                        itemBuilder: (context, index) => Material(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.grey.shade300)),
                          color: Colors.white,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(RoutePath.product, parameters: {
                                "title":
                                    controller.foundproductList[index].title ??
                                        "",
                                "desc": controller
                                        .foundproductList[index].description ??
                                    "",
                                "price": controller
                                    .foundproductList[index].price
                                    .toString(),
                                "rate": controller
                                        .foundproductList[index].rating?.rate
                                        .toString() ??
                                    "",
                                "image":
                                    controller.foundproductList[index].image ??
                                        ""
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      controller
                                              .foundproductList[index].image ??
                                          "",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          controller.foundproductList[index]
                                                  .title ??
                                              "",
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Price: ${controller.foundproductList[index].price}"),
                                      Text(
                                          "${controller.foundproductList[index].rating?.rate}")
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : const Center(
                        child: Text("No data"),
                      ),
          );
        });
  }
}
