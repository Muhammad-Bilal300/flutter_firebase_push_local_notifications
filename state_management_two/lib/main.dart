import 'package:flutter/material.dart';
import 'package:state_management_two/models/channelModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<String> channelNames = [
  //   "EasyApproach",
  //   "dbstech",
  //   "GeekyShows",
  //   "Thapa technical",
  //   "Flutter Way",
  //   "EasyApproach",
  //   "dbstech",
  //   "GeekyShows",
  //   "Thapa technical",
  //   "Flutter Way"
  // ];

  final articles = List<channelModel>.generate(
      30,
      (index) => channelModel(
          name: "Channel Name ${index}",
          detail: "This is The detail of channel: ${index}"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Application"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("${articles[index].name}"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(articles[index])));
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: articles.length),
    );
  }
}

class DetailScreen extends StatelessWidget {
  channelModel selectedChannel;
  DetailScreen(this.selectedChannel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Screen"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text("${selectedChannel.name}"),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text("${selectedChannel.detail}"),
          ),
        ],
      ),
    );
  }
}
