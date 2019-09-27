import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ImagePage(),

    );
  }
}

class ImagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ImageState();
}
class _ImageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hình ảnh"),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(height: 200),
                child: Image.asset(
                  "assets/images/glass.jfif",
                ),
              ),
              Container(
                constraints: BoxConstraints.expand(
                  height: 200,),
                child: Image.asset(
                  "assets/images/glass.jfif",
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                constraints: BoxConstraints.expand(
                  height: 200,),
                child: Image.asset(
                  "assets/images/glass.jfif",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                constraints: BoxConstraints.expand(
                  height: 200,),
                child: Image.asset(
                  "assets/images/glass.jfif",
                  alignment: Alignment.topLeft,
                ),
              ),
              Container(
                constraints: BoxConstraints.expand(
                  height: 200,),
                child: Image.asset(
                  "assets/images/glass.jfif",
                  alignment: Alignment.bottomRight,
                ),
              ),
              Container(
                constraints: BoxConstraints.expand(
                  height: 200,),
                child: Image.asset(
                  "assets/images/glass.jfif",
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomRight,
                ),
              )
            ],
          )),
    );
  }
}