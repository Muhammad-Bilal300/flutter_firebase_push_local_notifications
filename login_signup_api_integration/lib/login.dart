import 'dart:io';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:login_signup_api_integration/services/api.dart';
import 'package:login_signup_api_integration/signup.dart';
import 'translations/locale_keys.g.dart';
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(LocaleKeys.Demo_Application.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  child: Text(
                    LocaleKeys.Login_Page.tr(),
                    style: TextStyle(
                        fontSize: 33,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    decoration: InputDecoration(
                        // prefixIcon: Icon(Icons.mail),
                        border: InputBorder.none,
                        hintText: LocaleKeys.Email.tr()),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    onSaved: (value) {},
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: LocaleKeys.Password.tr()),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    login(
                      phoneController.text.toString(),
                      passwordController.text.toString(),
                    );
                  },
                  child: Container(
                    // height: 100,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green),
                    child: Center(
                      child: Text(
                        LocaleKeys.Login.tr(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${LocaleKeys.Dont_have_an_Account.tr()}?",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => signUp()));
                      },
                      child: Text(
                        LocaleKeys.Signup.tr(),
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Text(LocaleKeys.Or_Sign_In_With.tr(),
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.facebook_outlined,
                          color: Colors.blue,
                          size: 45,
                        )),
                    SizedBox(
                      width: 15,
                    ),
                    Center(
                      child: Container(
                        height: 50,
                        width: 48,
                        child: Image.asset(
                          "assets/googleLogo.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Platform.isIOS
                        ? Container(
                            height: 45,
                            width: 40,
                            child: Image.asset(
                              "assets/appleLogo.png",
                              fit: BoxFit.fill,
                            ),
                          )
                        : Container(),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () async {
                          await context.setLocale((Locale('en')));
                        },
                        child: Text("English")),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextButton(
                        onPressed: () async {
                          await context.setLocale((Locale('ar')));
                        },
                        child: Text("العربية"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login(String phone, String password) async {
    try {
      Response response = await post(
        Uri.parse(
            "https://evolutionwing.com/apis/mardud/public/api/user-login"),
        body: json.encode(<String, String>{
          "phone": phone,
          "password": password,
          "device_token": "abc",
          "device_type": "123"
        }),
        headers: {'Content-type': "application/json"},
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        var token = data['token'];
        print(token);
        print(data);
        print("Account LoggedIn Successfully");
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
