import 'package:flutter/material.dart';

class Whatsapp extends StatelessWidget {
  const Whatsapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp"),
        centerTitle: true,
        actions: const [
          ElevatedButton(onPressed: null, child: Icon(Icons.save)),
          ElevatedButton(onPressed: null, child: Icon(Icons.delete))
        ],
        backgroundColor: Colors.green,
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: const [
        Card(
          child: ListTile(
            title: Text("Fardeen"),
            subtitle: Text("Hi, Saddar! Let's meet today..."),
            leading: CircleAvatar(),
            trailing: Icon(Icons.star),
          ),
        ),
        Card(
          child: ListTile(
            title: Text("Faisal"),
            subtitle: Text("Kithey??"),
            leading: CircleAvatar(),
            trailing: Icon(Icons.star),
          ),
        )
      ]),
    );
  }
}
