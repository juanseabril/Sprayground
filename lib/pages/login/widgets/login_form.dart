import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../constants.dart';
import '../../../main.dart';
import 'social_login.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formLoginKey = GlobalKey<FormBuilderState>();
  bool _isShowAlert = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;

    return Center(
      child: FormBuilder(
        key: _formLoginKey,
        child: Padding(
          padding: EdgeInsets.only(
              left: sizeWidth * 0.09,
              right: sizeWidth * 0.09,
              top: sizeHeight * 0.12,
              bottom: sizeHeight * 0.03),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FormBuilderTextField(
                decoration: fbEmailDecoration,
                name: 'email',
                style: fbColorWhite,
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.next,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: 'No puede estar vacio'),
                  FormBuilderValidators.email(
                      errorText: 'No es un correo valido'),
                ]),
              ),
              SizedBox(
                height: sizeHeight * 0.035,
              ),
              FormBuilderTextField(
                decoration: fbPassDecoration,
                name: 'password',
                obscureText: true,
                style: fbColorWhite,
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.done,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: 'No puede estar vacio'),
                  FormBuilderValidators.minLength(6,
                      errorText: 'Mínimo seis caracteres'),
                ]),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              _isShowAlert
                  ? Column(
                      children: const [
                        Text(
                          "Datos incorrectos.",
                          style: fbFloatingLabelStyle,
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    )
                  : Container(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: bgLogin,
                  primary: bgSignup,
                  shape: radiusBorder,
                ),
                onPressed: () {
                  if (_formLoginKey.currentState!.saveAndValidate()) {
                    print(_formLoginKey.currentState!.value['email']);
                    print(_formLoginKey.currentState!.value['password']);
                    logIn();
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizeWidth * 0.05,
                      vertical: sizeHeight * 0.02),
                  child: const Text(
                    'INGRESAR',
                    style: fbBotonStyle,
                  ),
                ),
              ),
              SizedBox(height: sizeHeight * 0.02),
              const Text("--  ó Continua con  --", style: fbContinue),
              SizedBox(height: sizeHeight * 0.02),
              SizedBox(
                height: sizeHeight * 0.05,
                child: const SocialLogin(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future logIn() async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _formLoginKey.currentState!.value['email'].trim(),
        password: _formLoginKey.currentState!.value['password'].trim(),
      );
    } catch (e) {
      setState(() {
        _isShowAlert = !_isShowAlert;
      });
      Navigator.of(context).pop();
      return e;
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
