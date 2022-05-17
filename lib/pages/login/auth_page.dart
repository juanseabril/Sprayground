import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store/constants.dart';
import 'package:store/pages/login/login_page.dart';
import 'package:store/pages/login/signup_page.dart';
import 'package:store/pages/store/store_page.dart';

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

    return SafeArea(
      child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const StorePage();
            } else {
              return Scaffold(
                body: SingleChildScrollView(
                  child: Container(
                    height: sizeHeight,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: defaultDuration,
                          height: sizeHeight,
                          width: sizeWidth * 0.85,
                          left: _isShowLogin
                              ? 0
                              : (-sizeWidth * 0.85) + (sizeWidth * 0.15),
                          child: GestureDetector(
                            onTap: (() {
                              if (WidgetsBinding
                                      .instance.window.viewInsets.bottom >
                                  0.0) {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                setState(() {
                                  _isShowLogin = _isShowLogin;
                                });
                              } else {
                                setState(() {
                                  _isShowLogin = !_isShowLogin;
                                });
                              }
                            }),
                            child: const LoginPage(),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: defaultDuration,
                          height: sizeHeight,
                          width: sizeWidth * 0.85,
                          left: _isShowLogin
                              ? sizeWidth * 0.85
                              : sizeWidth * 0.15,
                          child: GestureDetector(
                            onTap: (() {
                              if (WidgetsBinding
                                      .instance.window.viewInsets.bottom >
                                  0.0) {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                setState(() {
                                  _isShowLogin = _isShowLogin;
                                });
                              } else {
                                setState(() {
                                  _isShowLogin = !_isShowLogin;
                                });
                              }
                            }),
                            child: const SignUpPage(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
