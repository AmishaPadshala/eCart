import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/app_settings.dart';
import 'package:shop/core/utils/global.dart';
import 'package:shop/core/utils/app_icons.dart';
import 'package:shop/core/utils/app_images.dart';
import 'package:shop/ui/shared/bottomBar/bottomBar.dart';
import 'package:shop/ui/shared/bottomBar/bottomBarController.dart';


class BaseScreen extends StatelessWidget {
  static const String routeName = "/baseScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(right: kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    splashRadius: 1,
                    icon: Image.asset(
                      AppIcons.back,
                      color: Colors.transparent,
                    ),
                  ),
                  GetBuilder(
                    builder: (BottomBarController controller) {
                      return controller.currentTab == 0
                          ? Text(
                              "Home",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            )
                          : Text(
                              "Cart",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            );
                    },
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Container(
                      height: 35,
                      width: 35,
                      child: Image.asset(
                        AppImages.profile,
                        fit: BoxFit.cover,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(80),
      ),
      body: SafeArea(
        child: GetBuilder(
          builder: (BottomBarController controller) {
            print(controller.currentTab);
            return IndexedStack(
              index: controller.currentTab,
              children: tabList,
            );
          },
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
