// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {
    "Demo_Application": "Demo Application",
    "Login_Page": "Login Page",
    "Email": "Email",
    "Password": "Password",
    "Login": "Login",
    "Signup_Page": "Signup Page",
    "Dont_have_an_Account": "Dont have an Account",
    "Signup": "Signup",
    "Or_Sign_In_With": "Or Sign In With",
    "Name": "Name",
    "Confirm_Password": "Confirm Password",
    "Already_have_an_Account": "Already have an Account"
  };
  static const Map<String, dynamic> ar = {
    "Demo_Application": "تطبيق تجريبي",
    "Login_Page": "صفحة تسجيل الدخول",
    "Email": "بريد الالكتروني",
    "Password": "كلمه السر",
    "Login": "تسجيل الدخول",
    "Dont_have_an_Account": "ليس لديك حساب",
    "Signup": "اشتراك",
    "Or_Sign_In_With": "أو قم بتسجيل الدخول باستخدام",
    "Signup_Page": "صفحة التسجيل",
    "Name": "اسم",
    "Confirm_Password": "تأكيد كلمة المرور",
    "Already_have_an_Account": "هل لديك حساب"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": en,
    "ar": ar
  };
}
