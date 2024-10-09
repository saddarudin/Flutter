import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              alignment: Alignment.topCenter,
              child: Image.asset('assets/images/login.png'),
            ),
          ],
        ));
  }
}
