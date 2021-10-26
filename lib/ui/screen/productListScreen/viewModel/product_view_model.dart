import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_images.dart';
import 'package:shop/core/utils/size_config.dart';
import '../model/product_model.dart';

class ProductViewModel {
  final ProductModel productModel;

  ProductViewModel({required this.productModel});


  Widget get image{
    return Container(
      height: getHeight(120),
      width: getWidth(260),
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
      textAlign: TextAlign.start,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 13, color: AppColors.textLightColor),
    );
  }

  Widget get price{
     return Text(
       "\$${productModel.price.toString()}",
       style: TextStyle(
           fontSize: getWidth(14), color: AppColors.textDarkColor,fontWeight: FontWeight.w700),
     );
  }

  Widget get cartQuantityText{
    return Visibility(
      visible: productModel.cartQuantity == 0 ? false : true,
      child: Text(
        productModel.cartQuantity.toString(),
        style: TextStyle(
            fontSize: 14, color: AppColors.textDarkColor),
      ),
    );
  }

  Widget get minusButton {
    return Visibility(
      visible: productModel.cartQuantity == 0 ? false : true ,
      child: Container(
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
