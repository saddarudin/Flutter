import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Offset _offset = const Offset(0.0, 0.0);
  double scale = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("My App"),
      ),
      body: Center(
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              _offset = Offset(
                  _offset.dx + details.delta.dx, _offset.dy + details.delta.dy);
            });
          },
          // for zoom in and zoom out
          // onScaleUpdate: (details) {
          //   setState(() {
          //     scale = details.scale;
          //   });
          // },
          // for single click on screen
          onTap: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("One Tap Pressed")));
          },
          // for double click on screen
          onDoubleTap: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Double Tap")));
          },
          onLongPress: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Long Press")));
          },
          child: Transform.translate(
            offset: _offset,
            child: Container(
              // media query: means to assign size according to each device
              width: MediaQuery.of(context).size.width / 2,
              height: 300,
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}
