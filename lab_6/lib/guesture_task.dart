import 'package:flutter/material.dart';

class GuestureTask extends StatefulWidget {
  const GuestureTask({super.key});

  @override
  State<GuestureTask> createState() => _GuestureTaskState();
}

class _GuestureTaskState extends State<GuestureTask> {
  int _index = 0;
  double scale = 1.0;
  final List<String> _images = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',
    'assets/images/img3.jpg',
    'assets/images/img4.jpg',
    'assets/images/img5.JPG',
    'assets/images/img6.jpg',
    'assets/images/img7.jpg',
    'assets/images/img8.jpg',
    'assets/images/img9.jpg',
    'assets/images/img10.jpg',
    'assets/images/img11.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab Task of Guesture Widget"),
      ),
      body: Center(
        child: GestureDetector(
          onScaleUpdate: (details) {
            setState(() {
              scale = details.scale;
            });
          },
          onTap: () {
            setState(() {
              _index = (_index + 1) % _images.length;
            });
          },
          child: Transform.scale(
              scale: scale, child: Image.asset(_images[_index])),
        ),
      ),
    );
  }
}
