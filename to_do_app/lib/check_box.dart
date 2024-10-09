import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool ch1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Checkbox(
                value: ch1,
                onChanged: (value) {
                  ch1 = value!;
                  setState(() {});
                })
          ],
        ),
      ),
    );
  }
}
