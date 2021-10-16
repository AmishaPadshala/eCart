import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop/core/utils/app_json.dart';
import 'package:shop/ui/screen/cartScreen/controller/cart_list_controller.dart';
import '../model/product_model.dart';
import '../viewModel/product_view_model.dart';

class ProductListController extends GetxController {
  List<ProductViewModel> _ProductViewModelList = [];

  List<ProductViewModel> get productViewModelList => _ProductViewModelList;

  CartListController? cartListController;


  @override
  void onInit() {
    super.onInit();
  }


  loadProductJsonFile()  async{
    cartListController = Get.find<CartListController>();
    Map<String, dynamic> myCarts = cartListController!.getSavedMyCart();
    _ProductViewModelList.clear();
    var jsonText = await rootBundle.loadString(AppJson.product);
    var data = json.decode(jsonText);
    data[AppJson.productListKey].forEach((element) {
      ProductModel productModel = ProductModel.fromJson(element);
      productModel.cartQuantity = myCarts[productModel.id] ?? 0;
      productViewModelList.add(ProductViewModel(productModel : productModel));
    });
    update();
  }

  addToCart(ProductModel productModel) {
    productModel.cartQuantity += 1;
    cartListController!.saveMyCart(productModel);
    update();
  }

  removeFromCart(ProductModel productModel) {
    productModel.cartQuantity -= productModel.cartQuantity == 0 ? 0 : 1;
    cartListController!.saveMyCart(productModel);
    update();
  }


}
