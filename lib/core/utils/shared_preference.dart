
import 'package:shop/core/constants/app_settings.dart';

import 'global.dart';

Map<String,dynamic> getMyCartFromSharedPref() {
  print("Stored My cart");
  print(sharedPreference.read(kMyCartSharedReference));
  return sharedPreference.read(kMyCartSharedReference) ?? {};
}

void saveMyCartToSharePref(Map<String,dynamic> myCart) {
  sharedPreference.write(
      kMyCartSharedReference, myCart);
}
