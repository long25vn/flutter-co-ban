import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather/widgets/box_container.dart';
import 'package:weather/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Response> fetchPost() async {
  final response =
      await http.get('https://api.darksky.net/forecast/5e78215b8ecd6da29dacd01bfcd7a1e0/10.34599,107.08426');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return Response.fromJson(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

class Hourly extends StatefulWidget {
  const Hourly({Key key, this.child, this.margin}) : super(key: key);
  final Widget child;
  final EdgeInsetsGeometry margin;
  @override
  _HourlyState createState() => _HourlyState();
}

class _HourlyState extends State<Hourly> {
  Future<Post> post;
  Future<Response> response;

  @override
  void initState() {
    super.initState();
    response = fetchPost();
    print("post");
    print(post);
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: BoxContainer(
              child: Container(
                child: FutureBuilder<Response>(
                    future: response,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data);
                        return Text(snapshot.data.hourlymodal.summary + "123");
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      // By default, show a loading spinner.
                      return CircularProgressIndicator();
                    },
                  ),
              )
            )),
      ],
    );
  }
}
