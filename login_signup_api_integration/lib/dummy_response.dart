import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'services/api.dart';
import 'services/api.dart';

class CheckApi extends StatefulWidget {
  const CheckApi({Key? key}) : super(key: key);

  @override
  _CheckApiState createState() => _CheckApiState();
}

class _CheckApiState extends State<CheckApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getToken();
          },
          child: Text("Get Access Token"),
        ),
      ),
    );
  }

  void getToken() async {
    try {
      // Response response = await post(
      //   Uri.parse(
      //       "https://evolutionwing.com/apis/mardud/public/api/user-login"),
      //   body: json.encode(<String, String>{
      //     "phone": phone,
      //     "password": password,
      //     "device_token": "abc",
      //     "device_type": "123"
      //   }),
      //   headers: {'Content-type': "application/json"},
      // );

      final queryParameters = {
        'baseSiteId': 'ykafb2c-ae',
        'clientID': 'customer_group',
        'clientSecret': 'secret',
      };
      // String queryString = Uri.parse(queryParameters: queryParams).query;
      // final uri =  Uri.https(ROOT2, '/${queryParameters['baseSiteId']}/oath/client', queryParameters);

      // final response = await http.get(uri, headers: headers);

      final uri = Uri.https(
          ROOT2, '/albaraka/rest/v2/ykafb2c-ae/oath/client', queryParameters);
      final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        var token = data['access_token'];
        print(token);
        print(data);
        print("Account LoggedIn Successfully");
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
