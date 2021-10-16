import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/cart_list_controller.dart';
import 'view/cart_view.dart';

class CartListScreen extends StatelessWidget {
  final CartListController cartListController = Get.find<CartListController>();

  @override
  Widget build(BuildContext context) {
   return GetBuilder(builder: (CartListController cartListController) {
      cartListController.getMyCart();
      return cartListController.cartViewModelList.isEmpty ? Center(child:Text("Your cart is empty.") ): ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: cartListController.cartViewModelList.length,
        itemBuilder: (context, index) {
          return CartView(cartViewModel:cartListController.cartViewModelList[index]);
        },
      );
    });

  }
}
