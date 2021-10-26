import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop/ui/screen/auth/face_auth.dart';
import 'package:shop/ui/screen/basescreen.dart';

import 'core/Navigations/routes.dart';
import 'core/constants/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop',
      theme: AppTheme.defTheme,
      getPages: AppPages.pages,
      initialRoute: FaceAuth.routeName,
    );
  }
}
