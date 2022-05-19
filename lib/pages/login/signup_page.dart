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
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.center,
      color: bgSignup,
      height: sizeHeight,
      width: sizeWidth,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// --- Form
          Padding(
            padding: const EdgeInsets.only(bottom: 75, top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/logos/sprayground_logo_red.png",
                  scale: 1.2,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: bgCardAuth,
                  ),
                  height: sizeHeight * 0.7,
                  width: sizeWidth * 0.7,
                  child: const SignUpForm(),
                ),
              ],
            ),
          ),

          /// --- Image
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
