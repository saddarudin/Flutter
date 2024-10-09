import "package:flutter/material.dart";

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => __SignUpState();
}

class __SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  final emailc = TextEditingController();
  // and you will make separate for each text field
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
      ),
      body: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                // obscureText: true, if you enable your text will be hidden for example Password
                controller: emailc,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Email "),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email cannot be empty";
                  }
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      print("Email ${emailc.text}");
                    }
                  },
                  child: const Text("SignUp"))
            ],
          )),
    );
  }
}
