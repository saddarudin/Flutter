import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  Future<String> getData() async{
    await Future.delayed(const Duration(seconds:10));
    return 'Greetings';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: FutureBuilder(future: getData(), builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return const CircularProgressIndicator();
        }
        else if(snapshot.hasError){
          return Text("${snapshot.error}");
        }
        else{
          return Text("${snapshot.data}");
        }
      }),),

    );
  }
}