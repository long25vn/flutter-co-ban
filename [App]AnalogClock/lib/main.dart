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


class Trangchinh extends StatefulWidget {
  @override
  _TrangchinhState createState() => _TrangchinhState();
}

int gio = 0;
int phut = 0;
int giay = 0;

class _TrangchinhState extends State<Trangchinh> {
  void dongho() {
    setState(() {
      var now = new DateTime.now();
      gio = now.hour;
      phut = now.minute;
      giay = now.second;
      print(giay);
    });
  }

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (Timer t) => dongho());
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
          child: Text("Đồng hồ $gio:$phut:$giay"),
        ),
      ),
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
    paint.strokeWidth = 2;
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2), size.width / 2, paint);

    int hour = gio;
    if (gio >= 12) {
      hour = gio - 12;
    }
    paint.strokeWidth = 8;
    paint.color = Colors.black;
    double R = size.width / 2;
    double AH = (R*0.7*math.cos(toRadians(hour*30)));
    double OH = (R*0.7*math.sin(toRadians(hour*30)));
    canvas.drawLine(
      Offset(R, size.height / 2),
      Offset(R + OH,  size.height/2 - AH),
      paint,
    );

    paint.strokeWidth = 5;
    paint.color = Colors.blue;
    double AH2 = (R*math.cos(toRadians(phut*6)));
    double OH2 = (R*math.sin(toRadians(phut*6)));
    canvas.drawLine(
      Offset(R, size.height / 2),
      Offset(R + OH2,  size.height/2 - AH2),
      paint,
    );

    paint.strokeWidth = 3;
    paint.color = Colors.red;
    double AH3 = (R*math.cos(toRadians(giay*6)));
    double OH3 = (R*math.sin(toRadians(giay*6)));
    canvas.drawLine(
      Offset(R, size.height / 2),
      Offset(R + OH3,  size.height/2 - AH3),
      paint,
    );

  
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}



