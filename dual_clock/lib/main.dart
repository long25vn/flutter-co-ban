import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flip_card/flip_card.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Trangchinh(),
    );
  }
}

GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

@override
Widget build(BuildContext context) {
  return FlipCard(
    key: cardKey,
    flipOnTouch: false,
    front: Container(
      child: RaisedButton(
        onPressed: () => cardKey.currentState.toggleCard(),
        child: Text('Toggle'),
      ),
    ),
    back: Container(
      child: Text('Back'),
    ),
  );
}

class Trangchinh extends StatefulWidget {
  @override
  _TrangchinhState createState() => _TrangchinhState();
}

class _TrangchinhState extends State<Trangchinh> {
  String _gio = "00";
  String _phut = "00";
  String _giay = "00";


  void _incrementCounter() {
    setState(() {
      var now = new DateTime.now();
      var berlinWallFell = new DateTime.utc(1989, 11, 9);
      var moonLanding = DateTime.parse(now.toString()); // 8:18pm
      _gio = now.hour.toString();
      _phut = now.minute.toString();
      _giay = now.second.toString();
      // print("---");
      // print(moonLanding.hour);
      // print(now.hour.toString());
    });
  }



  @override
  void initState() {
    // print("---");
    Timer.periodic(Duration(seconds: 1), (Timer t) => _incrementCounter());
    // print("---");
    // double widthScreen = MediaQuery.of(context).size.width;
    // print("123" + widthScreen.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đồng hồ kim"),
      ),
      body: CustomPaint(
        painter: CurvePainter(),
        child: Center(
          child: Text(
              ".",
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CurvePainter extends CustomPainter {
  toRadians(x){
    return x * (math.pi)/180;
  }
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.amber;
    paint.strokeWidth = 5;
    canvas.drawLine(
      Offset(size.width / 2, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );

    paint.color = Colors.blue;
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);

    
    paint.color = Colors.green;

    canvas.drawLine(
      Offset(size.width / 2, size.height / 2),
      Offset(size.width / 2, (size.height/2) - (size.width/2)),
      paint,
    );

    paint.color = Colors.red;
    canvas.drawLine(
      Offset(size.width / 2, size.height / 2),
      Offset(size.width * 3 / 4, (size.height/2) - ((size.width/2)*0.866)),
      paint,
    );

    paint.color = Colors.purple;

    canvas.drawLine(
      Offset(size.width / 2, size.height / 2),
      Offset(size.width * 3 / 4, (size.height/2) - ((size.width/2)*0.866)),
      paint,
    );


    paint.color = Colors.red;
    double AH1 = ((size.width/2)*math.cos(toRadians(60)));
    double OH1 = ((size.width/2)*math.sin(toRadians(60)));
    canvas.drawLine(
      Offset(size.width / 2, size.height / 2),
      Offset(size.width /2 + OH1,  size.height/2 - AH1),
      paint,
    );


    paint.color = Colors.black;
    double AH = ((size.width/2)*math.cos(toRadians(6)));
    double OH = ((size.width/2)*math.sin(toRadians(180-6)));
    double R = size.width / 2;
    canvas.drawLine(
      Offset(size.width / 2, size.height / 2),
      Offset(size.width /2 + OH,  size.height/2 - AH),
      paint,
    );

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}



