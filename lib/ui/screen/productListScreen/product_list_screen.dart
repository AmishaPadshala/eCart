import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/product_list_controller.dart';
import 'view/product_view.dart';

class ProductScreen extends StatelessWidget {
  final ProductListController productListController =
      Get.find<ProductListController>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    productListController.loadProductJsonFile();
    return GetBuilder(
      builder: (ProductListController productListController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: GridView.builder(
            itemCount: productListController.productViewModelList.length,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: size.height < 700 ? (.60) : (.56),
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30),
            itemBuilder: (context, index) {
              return ProductView(
                  productViewModel:
                      productListController.productViewModelList[index]);
            },
          ),
        );
      },
    );
  }
}
