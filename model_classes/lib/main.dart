import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:model_classes/Model/models.dart';
import 'package:http/http.dart' as http;
import 'package:model_classes/signin.dart';

import 'Model/albumModel.dart';

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
      home: const SignIn(),
    );
  }
}

fetchAlbumPhotos() async {
  String url = "https://jsonplaceholder.typicode.com/photos";
  List<Album> albums = [];
  final response = await http.get(Uri.parse(url));
  print("url =>" + url);

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    for (var i in jsonData) {
      Album album = Album(
          albumId: i['albumId'], id: i['id'], title: i['title'], url: i['url']);
      albums.add(album);
    }
    // return Album.fromJson();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
  return albums;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String id = "";
  // Model model = Model();

  @override
  void initState() {
    super.initState();
    // var futureAlbum = fetchAlbumPhotos("5");
  }

  // getId2() {
  //   var lst = futureAlbum;
  //   var newList = [];
  //   for (var i in lst) {
  //     if (i['albumId'] == 2) {
  //       newList.add(i);
  //     }
  //   }
  //   return newList;
  // }
  // void getData() async {
  //   var res = await http.get("https://jsonplaceholder.typicode.com","users1");
  //   var r = json.decode(res.body);
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Album"),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchAlbumPhotos(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text("${snapshot.data[index].id}"),
                        Text("${snapshot.data[index].albumId}"),
                        Text("${snapshot.data[index].title}"),
                        Image.network("${snapshot.data[index].url}"),
                        Divider(
                          thickness: 1,
                        )
                        // Text("${snapshot.data[index].id}"),
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
