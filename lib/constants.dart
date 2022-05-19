import 'package:flutter/material.dart';

/// --- Global

const Color bgCardAuth = Colors.black;
const Color bgSignup = Colors.white;
const Color bgLogin = Color(0xffeb1c23);
const Color iStock = Colors.green;
const Color iStar = Colors.amber;

const Duration defaultDuration = Duration(milliseconds: 300);

const RoundedRectangleBorder radiusBorder =
    RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)));

/// --- FormBuilder

const TextStyle fbFloatingLabelStyle = TextStyle(fontSize: 20, color: bgSignup);
const TextStyle fbLabelStyle =
    TextStyle(color: bgLogin, fontWeight: FontWeight.bold);
const TextStyle fbContinue = TextStyle(
    color: Colors.white, fontSize: 15, fontFamily: 'CocogooseSemiLight');
const TextStyle fbBotonStyle =
    TextStyle(fontSize: 20, fontFamily: 'CocogooseSemiLightItalic');
const TextStyle fbAlertStyle = TextStyle(fontSize: 15, color: bgSignup);
const TextStyle fbColorWhite = TextStyle(color: bgSignup);

const OutlineInputBorder fbEnabledBorder = OutlineInputBorder(
  borderSide: BorderSide(color: bgLogin, width: 3),
);
const OutlineInputBorder fbFocusedBorder = OutlineInputBorder(
  borderSide: BorderSide(color: bgSignup, width: 3),
);

const InputDecoration fbPassDecoration = InputDecoration(
    focusedBorder: fbFocusedBorder,
    enabledBorder: fbEnabledBorder,
    labelText: 'Contraseña',
    labelStyle: fbLabelStyle,
    floatingLabelAlignment: FloatingLabelAlignment.center,
    floatingLabelStyle: fbFloatingLabelStyle);
const InputDecoration fbPassConfirmDecoration = InputDecoration(
    focusedBorder: fbFocusedBorder,
    enabledBorder: fbEnabledBorder,
    labelStyle: fbLabelStyle,
    labelText: 'Confirmación',
    floatingLabelAlignment: FloatingLabelAlignment.center,
    floatingLabelStyle: fbFloatingLabelStyle);
const InputDecoration fbEmailDecoration = InputDecoration(
  focusedBorder: fbFocusedBorder,
  enabledBorder: fbEnabledBorder,
  labelStyle: fbLabelStyle,
  labelText: 'Correo',
  floatingLabelAlignment: FloatingLabelAlignment.center,
  floatingLabelStyle: fbFloatingLabelStyle,
);

/// --- Clipper

const TextStyle cNameStyle =
    TextStyle(color: bgSignup, fontFamily: 'CocogooseLight', fontSize: 13);

const TextStyle cPriceStyle =
    TextStyle(color: bgSignup, fontFamily: 'CocogooseItalic', fontSize: 17);

const TextStyle cStockStyle = TextStyle(
    color: bgSignup, fontFamily: 'CocogooseItalicLight', fontSize: 13);

/// --- Store

const TextStyle sTitleStyle = TextStyle(
  fontFamily: 'CocogooseSemilight',
  fontSize: 25,
);

const TextStyle sSTitleStyle = TextStyle(
  fontFamily: 'CocogooseSemilight',
  fontSize: 20,
);

const TextStyle sSeeAllStyle = TextStyle(
    fontFamily: 'CocogooseSemilight', fontSize: 10, color: Colors.red);
