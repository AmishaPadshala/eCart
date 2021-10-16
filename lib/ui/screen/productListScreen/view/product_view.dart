import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/ui/screen/productListScreen/controller/product_list_controller.dart';
import '../viewModel/product_view_model.dart';


class ProductView extends StatelessWidget {

  final ProductViewModel productViewModel;
  const ProductView({required this.productViewModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        builder: (ProductListController productListController) {
        return ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: productViewModel.image,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      productViewModel.name,
                      SizedBox(
                        height: 5,
                      ),
                      productViewModel.price,
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 15),
                  child: Row(
                    children: [
                      Spacer(),
                      // minus button
                      GestureDetector(
                          onTap: () {
                            productListController.removeFromCart(productViewModel.productModel);
                          },
                          child: productViewModel.minusButton
                      ),
                      // cartQuantity text
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: productViewModel.cartQuantityText
                      ),
                      GestureDetector(
                          onTap: () {
                            productListController.addToCart(productViewModel.productModel);
                          },
                          child: productViewModel.plusButton
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
