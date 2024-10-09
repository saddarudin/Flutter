import 'package:flutter/material.dart';

class Radiobutton extends StatefulWidget {
  const Radiobutton({super.key});

  @override
  State<Radiobutton> createState() => _RadiobuttonState();
}

class _RadiobuttonState extends State<Radiobutton> {
  String? gender;
  double slidervalue = 0;
  String? country;
  final countries = ["Pakistan", "Canada"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Row(
        children: [
          const Text("Select Gender"),
          Radio(
              value: "Male",
              groupValue: gender,
              onChanged: (value) {
                gender = value;
                setState(() {});
              }),
          const Text("Male"),
          Radio(
              value: "Female",
              groupValue: gender,
              onChanged: (value) {
                gender = value;
                setState(() {});
              }),
          const Text("Female"),
          const Text("Rate your programming skills:"),
          Slider(
              min: 0,
              max: 100,
              value: slidervalue,
              onChanged: (value) {
                slidervalue = value;
                setState(() {});
              }),
          DropdownButton(
              hint:const Text('Choose your country'),
              value: country,
              items: countries.map((countryitem) {
                return DropdownMenuItem(
                    value: countryitem, child: Text(countryitem));
              }).toList(),
              onChanged: (value) {
                country = value;
              })
        ],
      )),
    );
  }
}
