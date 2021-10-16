import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shop/core/utils/app_icons.dart';
import 'package:shop/core/utils/size_config.dart';

import '../basescreen.dart';

class FaceAuth extends StatefulWidget {
  static const String routeName = "/faceAuth";

  @override
  State<FaceAuth> createState() => _FaceAuthState();
}

class _FaceAuthState extends State<FaceAuth> {
  final LocalAuthentication auth = LocalAuthentication();

  String _authorized = 'Not Authorized';
  @override
  void initState() {
    super.initState();
  }


  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason: 'Let OS determine authentication method',
          useErrorDialogs: true,
          stickyAuth: true);
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    setState(() {
      _authorized;
      if (authenticated) {
        _authorized = 'Authorized';
        Get.toNamed(BaseScreen.routeName);
      } else {
        _authorized = "Not Authorized";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: getHeight(230),
              child: Center(
                child: SafeArea(
                  child: Column(
                    children: [
                      getSizedBox(h: 30),
                      Text(
                        "Welcome Back!",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      getSizedBox(h: 20),
                      Text(
                        "Fast and Secure Login",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      getSizedBox(h: 20),
                    ],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
              ),
            ),
            getSizedBox(h: 150),
            GestureDetector(
              onTap: () {
                _authenticate();
              },
              child: Image.asset(
                AppIcons.authentication,
                height: 120,
              ),
            ),
            getSizedBox(h: 10),
            Center(child: Text(_authorized)),
          ],
        ),
      ),
    );
  }
}
