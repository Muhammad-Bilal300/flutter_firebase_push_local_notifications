import 'package:firstapp/models/post_models.dart';
import 'package:firstapp/services/get_api.dart';
import 'package:firstapp/services/post_api.dart';
import 'package:flutter/material.dart';

class UI extends StatefulWidget {
  const UI({Key? key}) : super(key: key);

  @override
  _UIState createState() => _UIState();
}

class _UIState extends State<UI> {
  buildDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Add Post"),
            content: Column(
              children: [
                Text("Title: "),
                TextFormField(
                  controller: fieldController,
                  decoration: const InputDecoration(hintText: 'Enter Title'),
                )
              ],
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    // setState(() {
                    //   lst.removeAt(index);
                    //   lst2.removeAt(index);
                    // });
                    setState(() {
                      _futurePost = createPost(fieldController.text);
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("ADD")),
            ],
          );
        });
  }

  TextEditingController fieldController = new TextEditingController();
  Future<CreatePost>? _futurePost;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          buildDialog();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("POSTS"),
      ),
      body: FutureBuilder<CreatePost>(
        future: _futurePost,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
