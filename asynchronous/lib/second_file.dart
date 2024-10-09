import 'package:flutter/material.dart';

class SecondFile extends StatefulWidget {
  const SecondFile({super.key});

  @override
  State<SecondFile> createState() => _SecondFileState();
}

class _SecondFileState extends State<SecondFile> {
  Stream<String> getData() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      DateTime now = DateTime.now();
      yield '${now.hour}: ${now.minute}: ${now.second}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: StreamBuilder(
            stream: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else {
                return Text("${snapshot.data}");
              }
            }),
      ),
    );
  }
}
