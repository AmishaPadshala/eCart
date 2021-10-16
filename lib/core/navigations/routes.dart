import 'package:get/get.dart';
import 'package:shop/ui/screen/auth/face_auth.dart';
import 'package:shop/ui/screen/basescreen.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: BaseScreen.routeName,
      page: () => BaseScreen(),
    ),
    GetPage(
      name: FaceAuth.routeName,
      page: () => FaceAuth(),
    ),
  ];
}
