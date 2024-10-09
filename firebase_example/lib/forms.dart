import 'package:firebase_example/auth_service.dart';
import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final tc1 = TextEditingController();
  final tc2 = TextEditingController();

  AuthService? _authService;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                controller: tc1,
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
                controller: tc2,
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
                    if (_formKey.currentState!.validate()) {
                      _authService?.SignIn(tc1.text, tc2.text);
                    }
                  },
                  child: const Text("SignIn")),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _authService?.SignUp(tc1.text, tc2.text);
                    }
                  },
                  child: const Text("SignUp")),
            ])));
  }
}
