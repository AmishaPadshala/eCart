import 'package:get/get.dart';
import 'package:shop/ui/screen/cartScreen/controller/cart_list_controller.dart';
import 'package:shop/ui/screen/productListScreen/controller/product_list_controller.dart';

class BottomBarController extends GetxController {
  int _currentTab = 0;

  int get currentTab => _currentTab;

  final CartListController cartListController = Get.find<CartListController>();
  final ProductListController productListController = Get.find<ProductListController>();


  set currentTab(int value) {
    _currentTab = value;
    if(_currentTab == 0)productListController.update();
    if(_currentTab == 1)cartListController.update();
    update();
  }
}
