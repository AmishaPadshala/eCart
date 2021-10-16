import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/ui/screen/cartScreen/controller/cart_list_controller.dart';
import '../viewModel/cart_view_model.dart';


class CartView extends StatelessWidget {

  final CartViewModel cartViewModel;
  const CartView({required this.cartViewModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        builder: (CartListController cartListController) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 10, right: 20, top: 5, bottom: 5),
                    child: Row(
                      children: [
                        cartViewModel.image,
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Expanded(child: cartViewModel.name),
                                  SizedBox(width: 10,),
                                  GestureDetector(
                                    child: cartViewModel.clearButton,
                                    onTap: () {
                                      cartListController.clearCart(cartViewModel.productModel);
                                    },
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  cartViewModel.price,
                                  Spacer(),
                                  // minus button
                                  GestureDetector(
                                      onTap: () {
                                        cartListController.removeFromCart(cartViewModel.productModel);
                                      },
                                      child: cartViewModel.minusButton
                                  ),
                                  // cartQuantity text
                                  Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5),
                                      child: cartViewModel.cartQuantityText
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        cartListController.addToCart(cartViewModel.productModel);
                                      },
                                      child: cartViewModel.plusButton
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          );
      }
    );
  }
}
