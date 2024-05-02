import 'package:e_commerce_task/product/view_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ViewProductController());
    // final displayHeight = MediaQuery.of(context).size.height;
    // final displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 200.0,
              child: Image.network(
                controller.image,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(20.0),
            Text(
              controller.title,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            const Gap(10.0),
            Text(controller.description),
            const Gap(10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price ${controller.price}",
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Rating ${controller.rating}",
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: const ContinuousRectangleBorder()),
              child: const Text("Add to cart"),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: const ContinuousRectangleBorder()),
              child: const Text("Buy now"),
            ),
          )
        ],
      ),
    );
  }
}
