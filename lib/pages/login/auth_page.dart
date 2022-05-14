import 'package:flutter/material.dart';
import 'package:store/constants.dart';
import 'package:store/pages/login/login_page.dart';
import 'package:store/pages/login/signup_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isShowLogin = true;

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: defaultDuration,
            height: sizeHeight,
            width: sizeWidth * 0.85,
            left: _isShowLogin ? 0 : (-sizeWidth * 0.85) + (sizeWidth * 0.15),
            child: GestureDetector(
              onTap: (() {
                setState(() {
                  _isShowLogin = !_isShowLogin;
                });
              }),
              child: const LoginPage(),
            ),
          ),
          AnimatedPositioned(
            duration: defaultDuration,
            height: sizeHeight,
            width: sizeWidth * 0.85,
            left: _isShowLogin ? sizeWidth * 0.85 : sizeWidth * 0.15,
            child: GestureDetector(
              onTap: (() {
                setState(() {
                  _isShowLogin = !_isShowLogin;
                });
              }),
              child: const SignUpPage(),
            ),
          ),
        ],
      ),
    );
  }
}
