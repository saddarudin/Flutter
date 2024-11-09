import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_example/firebase_options.dart';
import 'package:firebase_example/signup.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //ensuring widgets are initialized
  await Firebase.initializeApp(
    //firebase is initialized
    options: DefaultFirebaseOptions
        .currentPlatform, // for current platform like web, android, iphone etc
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}
