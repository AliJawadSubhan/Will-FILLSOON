import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color? pickedColor;
  pickColor(int colorID) {
    var colour = myColors[colorID];

    setState(() {
      if (colour != pickedColor) {
        colorsW[colorID].isVisible = true;
        pickedColor = colour;
      } else {
        pickedColor = Colors.white;
      }
    });
  }

  List<Color> myColors = [
    Colors.black,
    Colors.orange,
    Colors.red,
    Colors.blue,
    Colors.blueAccent,
    Colors.redAccent,
    Colors.purple,
    Colors.purpleAccent,
    Colors.grey,
  ];

  bool checkVisivility(int colorID) {
    for (var i = 0; i < myColors.length; i++) {
      return colorID == i;
    }

    return false;
  }

  bool check = false;

  List<ColorPicker> colorsW = [];

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
            SizedBox(
              height: 400,
              child: GridView.builder(
                // physics: NeverScrollableScrollPhysics(),
                itemCount: myColors.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (_, idx) {
                  var colorPicker = ColorPicker(
                      isVisible: colorsW[idx].isVisible,
                      color: myColors[idx],
                      onTap: () {
                        checkVisivility(idx);
                        pickColor(idx);
                        print("Picking Color");
                      });

                  colorsW.add(colorPicker);
                  return colorPicker;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ColorPicker extends StatelessWidget {
  ColorPicker(
      {super.key, this.color, required this.onTap, required this.isVisible});

  final Color? color;
  final VoidCallback onTap;
  var isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color ?? Colors.lightBlue,
            shape: BoxShape.circle,
          ),
          height: 20,
          width: 50,
          child: Visibility(
            visible: isVisible,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.check,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
