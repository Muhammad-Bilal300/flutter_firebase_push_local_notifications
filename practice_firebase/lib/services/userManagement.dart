import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice_firebase/screens/login.dart';

class UserManagement {
  storeNewUser(user, context) {
    FirebaseFirestore.instance.collection("users").add({
      "name": user.name,
      "email": user.email,
      "password": user.password,
      "uid": user.uid
    }).then((value) {
      Navigator.of(context).pop();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }).catchError((e) {
      print(e);
    });
  }
}
