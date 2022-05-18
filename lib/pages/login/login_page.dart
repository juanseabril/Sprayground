import 'package:flutter/material.dart';

import '../../constants.dart';
import 'widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;

    return Container(
      height: sizeHeight,
      width: sizeWidth,
      color: bgLogin,
      alignment: Alignment.center,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 150, top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/logos/sprayground_logo_white.png",
                  scale: 1.2,
                ),
                Container(
                  height: sizeHeight * 0.6,
                  width: sizeWidth * 0.7,
                  decoration: BoxDecoration(
                      color: bgCardAuth,
                      borderRadius: BorderRadius.circular(35)),
                  child: const LoginForm(),
                )
              ],
            ),
          ),
          Positioned(
            left: sizeWidth * 0.19,
            top: sizeHeight * 0.15,
            child: Image.asset(
              "assets/images/logos/sprayground_logo_sinfondo.png",
              scale: 2.5,
            ),
          ),
        ],
      ),
    );
  }
}
