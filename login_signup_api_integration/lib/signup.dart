import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart';
import 'package:login_signup_api_integration/login.dart';
import 'package:login_signup_api_integration/services/api.dart';
import 'translations/locale_keys.g.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                    LocaleKeys.Signup_Page.tr(),
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
                    controller: nameController,
                    decoration: InputDecoration(
                        // prefixIcon: Icon(Icons.mail),
                        border: InputBorder.none,
                        hintText: LocaleKeys.Name.tr()),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    controller: emailController,
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
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: LocaleKeys.Password.tr()),
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
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: LocaleKeys.Confirm_Password.tr()),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    signup(
                      nameController.text.toString(),
                      emailController.text.toString(),
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
                        LocaleKeys.Signup.tr(),
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
                      "${LocaleKeys.Already_have_an_Account.tr()} ?",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        LocaleKeys.Login.tr(),
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
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

  void signup(String name, String email, String password) async {
    try {
      Response response = await post(
        Uri.parse(
            "https://evolutionwing.com/apis/mardud/public/api/usersignuptest"),
        body: json.encode(<String, String>{
          "name": name,
          "email": email,
          "password": password
        }),
        headers: {'Content-type': "application/json"},
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['status']);

        print("Account Created Successfully");
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
