import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';

import 'pages/login/auth_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'CocogooseLightItalic',
      ),
      home: const AuthPage(),
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
    );
  }
}
