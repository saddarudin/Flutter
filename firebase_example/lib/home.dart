import 'package:firebase_auth/firebase_auth.dart';
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

  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Form(
          key: _formKey,
          child: Column(children: [
            const SizedBox(height: 30),
            SizedBox(
              width: 200,
              height: 50,
              child: TextFormField(
                controller: tc1,
                decoration: const InputDecoration(
                    hintText: 'Enter your email', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter valid information';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: 200,
              child: TextFormField(
                obscureText: true,
                controller: tc2,
                decoration: const InputDecoration(
                    hintText: 'Enter password', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter valid information';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    User? user = await _authService.signIn(
                        tc1.text.toString(), tc2.text.toString());
                    if (user != null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('SignedIn Successfully'),
                        duration: Duration(milliseconds: 2000),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('SignIn Failed'),
                        duration: Duration(milliseconds: 2000),
                      ));
                    }
                  }
                },
                child: const Text("SignIn")),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    User? user = await _authService.signUp(
                        tc1.text.toString(), tc2.text.toString());
                    if (user != null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("SignedUp Successfully"),
                        duration: Duration(milliseconds: 2000),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Signed Up Failure"),
                        duration: Duration(milliseconds: 2000),
                      ));
                    }
                  }
                },
                child: const Text("SignUp")),
          ])),
    ));
  }
}
