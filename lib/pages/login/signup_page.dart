import 'package:flutter/material.dart';

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
      child: Center(
        child: SizedBox(
          height: sizeHeight * 0.75,
          width: sizeWidth * 0.7,
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: sizeHeight * 0.6,
                  width: sizeWidth * 0.7,
                  decoration: BoxDecoration(
                      color: bgCardAuth,
                      borderRadius: BorderRadius.circular(35)),
                ),
              ),
              Positioned(
                left: sizeWidth * 0.18,
                top: sizeHeight * 0.02,
                child: Image.asset(
                  "assets/sprayground_logo_sinfondo.png",
                  scale: 2.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
