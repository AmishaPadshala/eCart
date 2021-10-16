import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop/ui/screen/cartScreen/cart_list_screen.dart';
import 'package:shop/ui/screen/productListScreen/product_list_screen.dart';

final List<Widget> tabList = [ProductScreen(), CartListScreen()];
final sharedPreference = GetStorage(); // instance of getStorage class