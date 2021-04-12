import 'package:flutter/material.dart';
import 'package:sexyslider/sexyslider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double sliderValue;

  @override
  void initState() {
    sliderValue = 0.0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SexySlider(
              value: sliderValue,
              minValue: 0,
              maxValue: 100,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
              decoration: SexySliderDecoration(
                width: 200,
                height: 600,
                backgroundColor: Colors.black,
                valueColor: Colors.green,
                borderRadius: BorderRadius.circular(45),
              ),
            ),
            Text(sliderValue.toString(), style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}
