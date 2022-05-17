import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../constants.dart';
import '../../../main.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formSignUpKey = GlobalKey<FormBuilderState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  bool _isShowAlert = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;

    return Center(
      child: FormBuilder(
        key: _formSignUpKey,
        child: Padding(
          padding: EdgeInsets.only(
              left: sizeWidth * 0.09,
              right: sizeWidth * 0.09,
              top: sizeHeight * 0.09,
              bottom: sizeHeight * 0.04),
          child: Column(
            children: [
              FormBuilderTextField(
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.next,
                name: 'email',
                decoration: fbEmailDecoration,
                style: const TextStyle(color: bgSignup),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: 'No puede estar vacio'),
                  FormBuilderValidators.email(
                      errorText: 'No es un correo valido'),
                ]),
              ),
              SizedBox(
                height: sizeHeight * 0.025,
              ),
              FormBuilderTextField(
                obscureText: true,
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.next,
                name: 'password',
                decoration: fbPassDecoration,
                style: const TextStyle(color: bgSignup),
                controller: _pass,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: 'No puede estar vacio'),
                  FormBuilderValidators.minLength(6,
                      errorText: 'Mínimo seis caracteres'),
                ]),
              ),
              SizedBox(
                height: sizeHeight * 0.025,
              ),
              FormBuilderTextField(
                name: 'password_confirm',
                textInputAction: TextInputAction.done,
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: fbPassConfirmDecoration,
                style: const TextStyle(color: bgSignup),
                controller: _confirmPass,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: 'No puede estar vacio'),
                  FormBuilderValidators.minLength(6,
                      errorText: 'Mínimo seis caracteres'),
                  (val) {
                    if (_confirmPass.text != _pass.text) {
                      return 'No coinciden';
                    }
                    return null;
                  }
                ]),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              _isShowAlert
                  ? Column(
                      children: const [
                        Text(
                          "Correo ya fue registrado",
                          style: fbAlert,
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    )
                  : Container(),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_formSignUpKey.currentState!.saveAndValidate()) {
                    print(_formSignUpKey.currentState!.value['email']);
                    print(_formSignUpKey.currentState!.value['password']);
                    signUp();
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizeWidth * 0.008,
                      vertical: sizeHeight * 0.02),
                  child: const Text(
                    'REGISTRARME',
                    style: TextStyle(
                        fontSize: 20, fontFamily: 'CocogooseSemiLightItalic'),
                  ),
                ),
              ),
              SizedBox(height: sizeHeight * 0.015),
              const Text("--  ó Registrate con  --", style: fbContinue),
              SizedBox(height: sizeHeight * 0.015),
              Image.asset(
                "assets/images/google_logo_sinfondo.png",
                scale: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _formSignUpKey.currentState!.value['email'].trim(),
        password: _formSignUpKey.currentState!.value['password'].trim(),
      );
    } catch (e) {
      if (e.toString() ==
          "[firebase_auth/email-already-in-use] The email address is already in use by another account.") {
        setState(() {
          _isShowAlert = !_isShowAlert;
        });
      }
      Navigator.of(context).pop();
      print(e.toString());
      print(_isShowAlert);
      return e;
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
