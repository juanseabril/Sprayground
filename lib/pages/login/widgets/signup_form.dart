import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formSignUpKey = GlobalKey<FormBuilderState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

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
                  FormBuilderValidators.equal(_pass.text,
                      errorText: 'Contraseñas no coinciden')
                ]),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formSignUpKey.currentState!.saveAndValidate()) {
                    print(_formSignUpKey.currentState!.value['email']);
                    print(_formSignUpKey.currentState!.value['password']);
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
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
}
