import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List posts = [];
  Future getpost() async {
    //from jsonplaceholder
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    Response response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    posts.addAll(responsebody);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getpost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, i) {
            return Text("${posts[i]["title"]}");
          }),
    );
  }
}
