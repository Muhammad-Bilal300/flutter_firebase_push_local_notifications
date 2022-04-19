import 'package:flutter/material.dart';
import 'package:model_classes/Model/postModel.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

Future<PostModel?> submitData(String name, String job) async {
  var response = await http.post(Uri.https("reqres.in", "api/users"),
      body: {"name": name, "job": job});
  var data = response.body;
  print(data);

  if (response.statusCode == 201) {
    String responseString = response.body;
    PostModelFromJson(responseString);
  } else
    return null;
}

class _SignInState extends State<SignIn> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  PostModel? _postModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email:"),
            TextField(
              controller: nameController,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Job"),
            TextField(
              controller: jobController,
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 30,
              // width: MediaQuery.of(context).size.width * 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        String name = nameController.text;
                        String job = jobController.text;
                        PostModel? data = await submitData(name, job);

                        setState(() {
                          _postModel = data;
                        });
                      },
                      child: Text("Login")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
