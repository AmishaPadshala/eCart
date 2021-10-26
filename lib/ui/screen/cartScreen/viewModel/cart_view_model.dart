import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_images.dart';
import 'package:shop/core/utils/size_config.dart';
import 'package:shop/ui/screen/productListScreen/model/product_model.dart';

class CartViewModel {
  final ProductModel productModel;

  CartViewModel({required this.productModel});



  Widget get image{
    return Container(
        height: getHeight(70),
        width: getWidth(70),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: productModel.imageUrl.toString(),
          imageBuilder: (context, imageProvider) => Image(image: imageProvider,fit:BoxFit.cover ,),
          placeholder: (context, url) =>
              Center(child: CupertinoActivityIndicator()),
          errorWidget: (context, url, error) =>
              Image.asset(AppImages.placeHolder, fit: BoxFit.cover,),
        )
    );
  }


  Widget get name{
    return Text(
      productModel.name.toString(),
      maxLines: 1,
      softWrap: false,
      overflow:TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 15,
          color: AppColors.textDarkColor
      ),
    );
  }

  Widget get price{
     return Text(
       "\$${productModel.price.toString()}",
       style: TextStyle(
           fontSize: 13,
           fontWeight: FontWeight.w700,
           color: AppColors.textLightColor),
     );
  }

  Widget get clearButton {
    return Icon(
      Icons.clear,
      size: 17,
      color: AppColors.butttonIconColor,
    );
  }

  Widget get cartQuantityText{
    return Text(
      productModel.cartQuantity.toString(),
      style: TextStyle(
          fontSize: 14, color: AppColors.textDarkColor),
    );
  }

  Widget get minusButton {
    return Container(
      height: 25,
      width: 25,
      child: Icon(
        Icons.remove,
        size: 15,
        color: AppColors.butttonTextColor,
      ),
      decoration: BoxDecoration(
        color: AppColors.butttonBgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
    );
  }


  Widget get plusButton {
    return Container(
      height: 25,
      width: 25,
      child: Icon(
        Icons.add,
        size: 15,
        color: AppColors.butttonTextColor,
      ),
      decoration: BoxDecoration(
        color: AppColors.butttonBgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
    );
  }
}
