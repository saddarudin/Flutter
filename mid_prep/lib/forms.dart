import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                controller: myController,
                decoration: const InputDecoration(hintText: 'Enter your email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter valid information';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                controller: myController,
                decoration: const InputDecoration(hintText: 'Enter password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter valid information';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: const Text("Login")),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: const Text("SignUp")),
            ])));
  }
}
