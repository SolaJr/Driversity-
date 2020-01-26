import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  List data;

  Future<String> driverInfo() async {
    var response = await http.get(
        Uri.encodeFull("https://my-json-server.typicode.com/typicode/demo/posts"),
        headers: {
          "Accept": "application/json"
        }
    );
    data = json.decode(response.body);
    int driverId1 = data[0]["id"];
    int driverId2 = data[1]["id"];
    int driverId3 = data[2]["id"];
    print('Driver 1 ID: $driverId1');
    print('Driver 2 ID: $driverId2');
    print('Driver 3 ID: $driverId3');
    return "No errors";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new RaisedButton(
          child: new Text("Get driver information"),
          onPressed: driverInfo,
        ),
      ),
    );
  }
}