import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:store/pages/login/widgets/social_login.dart';

import '../../../constants.dart';
import '../../../main.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formSignUpKey = GlobalKey<FormBuilderState>();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _pass = TextEditingController();
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
                height: sizeHeight * 0.025,
              ),
              FormBuilderTextField(
                controller: _pass,
                decoration: fbPassDecoration,
                name: 'password',
                obscureText: true,
                style: fbColorWhite,
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.next,
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
                controller: _confirmPass,
                decoration: fbPassConfirmDecoration,
                name: 'password_confirm',
                obscureText: true,
                style: fbColorWhite,
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.center,
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
                          style: fbAlertStyle,
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
                      radiusBorder),
                ),
                onPressed: () {
                  if (_formSignUpKey.currentState!.saveAndValidate()) {
                    signUp();
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizeWidth * 0.008,
                      vertical: sizeHeight * 0.02),
                  child: const Text(
                    'REGISTRARME',
                    style: fbBotonStyle,
                  ),
                ),
              ),
              SizedBox(height: sizeHeight * 0.015),
              const Text("--  ó Registrate con  --", style: fbContinue),
              SizedBox(height: sizeHeight * 0.015),
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

  Future signUp() async {
    showDialog(
        barrierDismissible: false,
        context: context,
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
      return e;
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
