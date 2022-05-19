import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          "assets/images/logos/google_logo_sinfondo.png",
        ),
        Image.asset(
          "assets/images/logos/facebook_logo_sinfondo.png",
        ),
        Image.asset(
          "assets/images/logos/instagram_logo_sinfondo.png",
        ),
      ],
    );
  }
}
