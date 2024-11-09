import 'package:firebase_example/auth_service.dart';
import 'package:firebase_example/todo_screen.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  AuthService authService = AuthService();

  logIn() {
    if (_formKey.currentState!.validate()) {
      authService
          .signIn(_emailController.text, _passwordController.text)
          .then((user) {
        if (user != null) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const TodoScreen();
          }));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("An error occured!"),
            duration: Duration(milliseconds: 5000),
          ));
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("An error occured!"),
        duration: Duration(milliseconds: 5000),
      ));
    }
  }

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
                controller: _emailController,
                decoration: const InputDecoration(
                    hintText: 'Enter your email', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
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
                controller: _passwordController,
                decoration: const InputDecoration(
                    hintText: 'Enter password', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password!';
                  }
                  if (_passwordController.text.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  logIn();
                },
                child: const Text("LogIn")),
          ])),
    ));
  }
}
