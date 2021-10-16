
import 'package:get/get.dart';
import 'package:shop/core/utils/shared_preference.dart';
import 'package:shop/ui/screen/cartScreen/viewModel/cart_view_model.dart';
import 'package:shop/ui/screen/productListScreen/controller/product_list_controller.dart';
import 'package:shop/ui/screen/productListScreen/model/product_model.dart';

class CartListController extends GetxController {
  ProductListController? productListController;

  List<CartViewModel> _CartViewModelList = [];
  List<CartViewModel> get cartViewModelList => _CartViewModelList;

  Map<String,dynamic> _MyCart = {};
  Map<String, dynamic> get myCart => _MyCart;

  @override
  void onInit() {
    super.onInit();
}

  Map<String,dynamic> getSavedMyCart() {
    _MyCart = getMyCartFromSharedPref();
    return _MyCart;
  }
  getMyCart()  {
    print("getMyCart $myCart");
    productListController = Get.find<ProductListController>();
    _CartViewModelList.clear();
    myCart.forEach((id, cartQuantity) {
      int index = productListController!.productViewModelList.indexWhere((element) => element.productModel.id == id && element.productModel.cartQuantity != 0);
      if(index != -1)
        _CartViewModelList.add(CartViewModel(productModel: productListController!.productViewModelList[index].productModel));
    });
     update();
  }

  clearCart(ProductModel productModel) {
    productModel.cartQuantity = 0;
    saveMyCart(productModel);
  }


  addToCart(ProductModel productModel) {
    productModel.cartQuantity += 1;
    saveMyCart(productModel);
  }

  removeFromCart(ProductModel productModel) {
    productModel.cartQuantity -= productModel.cartQuantity == 0 ? 0 : 1;
    saveMyCart(productModel);
  }

  saveMyCart(ProductModel productModel){
    _MyCart[productModel.id] = productModel.cartQuantity;
    saveMyCartToSharePref(myCart);
    update();
  }

}
