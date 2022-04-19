import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'API Integration'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String url = "https://swapi.dev/api/people";
  final String url2 = "https://jsonplaceholder.typicode.com/users";
  late List<dynamic> data;

  getUser() async {
    var response = await http.get(Uri.parse(url2));
    var jsonData = jsonDecode(response.body);
    List<UserModel> users = [];
    for (var i in jsonData) {
      UserModel user =
          UserModel(id: i["id"], name: i["name"], userName: i["username"]);
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(future: getUser(),builder: (context,AsyncSnapshot snapshot){
          
        }),
  }
}

class UserModel {
  // int? id;
  // String? name;
  // String? userName; that values will pass may be null or provided later

  int id;
  String name;
  String userName;
  // List<dynamic> address = [ ];
  UserModel({
    required this.id,
    required this.name,
    required this.userName,
    // required this.address
  });
}
