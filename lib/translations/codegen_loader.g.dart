// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "Demo_Application": "Demo Application",
  "Login_Page": "Login Page",
  "Email": "Email",
  "Password": "Password",
  "Login": "Login",
  "Or_Sign_In_With": "Or Sign In With"
};
static const Map<String,dynamic> ar = {
  "Demo_Application": "تطبيق تجريبي",
  "Login_Page": "صفحة تسجيل الدخول",
  "Email": "بريد الالكتروني",
  "Password": "كلمه السر",
  "Login": "تسجيل الدخول",
  "Or_Sign_In_With": "أو قم بتسجيل الدخول باستخدام"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}
