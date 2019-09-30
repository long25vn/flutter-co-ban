import 'package:flutter/material.dart';

void main() => runApp(SliderExample());

class SliderExample extends StatefulWidget {
  @override
  _SliderExampleState createState() {
    return _SliderExampleState();
  }
}

class _SliderExampleState extends State {
  int _value = 6;
  double _sliderValue = 10.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slider Tutorial',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Slider Tutorial'),
          ),
          body: Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                  new Expanded(
                    child: Slider(
                      activeColor: Colors.indigoAccent,
                      min: 0.0,
                      max: 15.0,
                      onChanged: (newRating) {
                        setState(() => _sliderValue = newRating);
                      },
                      value: _sliderValue,
                    ),
                  ),
                ])),
          )),
    );
  }
}
