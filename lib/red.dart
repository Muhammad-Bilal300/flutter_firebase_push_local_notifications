import 'package:flutter/material.dart';

class RedPage extends StatelessWidget {
  const RedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "This is a Red Page",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
