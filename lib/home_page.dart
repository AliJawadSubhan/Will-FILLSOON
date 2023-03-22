import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color? pickedColor;
  void pickColor(Color colour) {
    setState(() {
      if (colour != pickedColor) {
        pickedColor = colour;
      } else {
        pickedColor = Colors.white;
      }
    });
  }

  List<Color> myColors = [Colors.black, Colors.orange];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: pickedColor ?? Colors.white,
              height: 200,
              width: 300,
              child: const Center(
                child: Text('Get your color now'),
              ),
            ),
            GestureDetector(
              onTap: () {
                pickColor(myColors[0]);
              },
              child: Container(
                color: Colors.black,
                height: 20,
                width: 50,
              ),
            ),
            GestureDetector(
              onTap: () {
                pickColor(myColors[1]);
              },
              child: Container(
                color: Colors.orange,
                height: 20,
                width: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
