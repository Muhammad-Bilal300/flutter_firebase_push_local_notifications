import 'dart:convert';
import 'package:firstapp/models/get_models.dart';
import 'package:http/http.dart' as http;

getPosts() async {
  var response =
      await http.get(Uri.https("jsonplaceholder.typicode.com", "posts"));
  var jsonData = jsonDecode(response.body);
  List<Posts> posts = [];
  for (var i in jsonData) {
    Posts post = Posts(
        userId: i["userId"], id: i["id"], title: i["title"], body: i["body"]);
    // Posts post = Posts(id: i["id"], name: i["name"], userName: i["username"]);
    posts.add(post);
  }
  return posts;
  // Posts post = Posts(
  //     userId: jsonData["userId"],
  //     id: jsonData["id"],
  //     title: jsonData["title"],
  //     body: jsonData["body"]);
}
