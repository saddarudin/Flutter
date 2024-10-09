// flutter pub add http
// flutter pub get
// run these commands in terminal

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _FirstPageState();
}

class _FirstPageState extends State<Api> {
  List? posts;
  Future<String> fetchPosts() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    try {
      var response = await http.get(url);
      posts = json.decode(response.body.toString());
    } catch (e) {
      return e.toString();
    }
    return 'error';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Working on APIs'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
            future: fetchPosts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else {
                return ListView.builder(
                    itemCount: posts!.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                        title: Text(posts![index]['title']),
                        subtitle: Text(posts![index]['body']),
                      ));
                    });
              }
            }),
      ),
    );
  }
}
