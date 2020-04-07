import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading Screen"),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Response res = await get('https://jsonplaceholder.typicode.com/todos/1');
    Map data = jsonDecode(res.body);
    print(data["title"]);
  }
}
