import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/utils/app_icons.dart';
import 'package:shop/ui/screen/cartScreen/controller/cart_list_controller.dart';
import 'package:shop/ui/screen/productListScreen/controller/product_list_controller.dart';
import 'package:shop/ui/shared/bottomBar/bottomBarController.dart';

class BottomBar extends StatefulWidget {
  // final BottomBarController bottomBarController =
  //     Get.put(BottomBarController());
  final CartListController cartListController = Get.put(CartListController());
  final ProductListController productListController = Get.put(ProductListController());

  final BottomBarController bottomBarController =
  Get.put(BottomBarController());

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (BottomBarController controller) {
      List<Map<String, dynamic>> list = [
        {
          'image': controller.currentTab == 0
              ? Image.asset(
                  AppIcons.home,
                  height: 28,
                )
              : Image.asset(
                  AppIcons.home,
                  height: 28,
                  color: Colors.grey,
                ),
        },
        {
          'image': controller.currentTab == 1
              ? Image.asset(
                  AppIcons.ShoppingCard,
                  height: 28,
                )
              : Image.asset(
                  AppIcons.ShoppingCard,
                  height: 28,
                  color: Colors.grey,
                )
        },
      ];
      return Container(
        child: SafeArea(
          child: Container(
            height: 60,
            // color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                list.length,
                (index) => GestureDetector(
                  onTap: () {
                    controller.currentTab = index;
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: list[index]['image'],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
