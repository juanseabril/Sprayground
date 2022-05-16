import 'package:flutter/material.dart';
import 'package:store/pages/login/widgets/signup_form.dart';

import '../../constants.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;

    return Container(
      height: sizeHeight,
      width: sizeWidth,
      color: bgSignup,
      alignment: Alignment.center,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 75, top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/sprayground_logo_red.png",
                  scale: 1.2,
                ),
                Container(
                  height: sizeHeight * 0.7,
                  width: sizeWidth * 0.7,
                  decoration: BoxDecoration(
                      color: bgCardAuth,
                      borderRadius: BorderRadius.circular(35)),
                  child: const SignUpForm(),
                ),
              ],
            ),
          ),
          Positioned(
            left: sizeWidth * 0.19,
            top: sizeHeight * 0.15,
            child: Image.asset(
              "assets/images/sprayground_logo_sinfondo.png",
              scale: 2.5,
            ),
          ),
        ],
      ),
    );
  }
}
