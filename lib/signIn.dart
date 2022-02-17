import 'package:flutter/material.dart';
import '../translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(LocaleKeys.Demo_Application.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
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
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: LocaleKeys.Email.tr()),
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
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: LocaleKeys.Password.tr()),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              // height: 100,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.green),
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
            SizedBox(
              height: 50,
            ),
            Text(LocaleKeys.Or_Sign_In_With.tr(),
                style: TextStyle(color: Colors.grey, fontSize: 16)),
            SizedBox(
              height: 10,
            ),
            Row(
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
                TextButton(onPressed: () async{
                    await context.setLocale((Locale('ar')));
                }, child: Text("العربية"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
