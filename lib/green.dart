import 'package:flutter/material.dart';

class GreenPage extends StatelessWidget {
  const GreenPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("This is a Green Page",style: TextStyle(
            fontSize: 30
          ),),
        ),
      ),
    );
  }
}