import 'dart:ui';
import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:weather/widgets/box_container.dart';
import 'package:weather/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Future<Response> fetchCurrent() async {
  final response = await http.get(
      'https://api.darksky.net/forecast/5e78215b8ecd6da29dacd01bfcd7a1e0/21.028511,105.804817');
  if (response.statusCode == 200) {
    return Response.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class Current extends StatefulWidget {
  const Current({Key key, this.child, this.margin}) : super(key: key);
  final Widget child;
  final EdgeInsetsGeometry margin;
  @override
  _CurrentState createState() => _CurrentState();
}

class _CurrentState extends State<Current> {
  Future<Post> post;
  Future<Response> response;
  double currentTem = 0;
  bool _visible = true;

  String readTimestampHourly(int timestamp, String formatTime) {
    var now = new DateTime.now();
    var format = new DateFormat(formatTime);
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + ' DAY AGO';
      } else {
        time = diff.inDays.toString() + ' DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
      } else {
        time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
      }
    }

    return time;
  }

  void setvisible() {
    _visible = !_visible;
    Future.delayed(const Duration(milliseconds: 200), () {
      _visible = true;
    });
  }

  @override
  void initState() {
    super.initState();
    response = fetchCurrent();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder<Response>(
            future: response,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 200),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(24),
                              ),
                              Column(
                                children: <Widget>[
                                  Text('Hà Nội'.toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20,
                                      )),
                                  Text(
                                      readTimestampHourly(
                                              snapshot.data.currentlymodal.time,
                                              "EEEE, MMM d")
                                          .toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ))
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    response = fetchCurrent();
                                    setvisible();
                                  });
                                },
                                iconSize: 20,
                                icon: Icon(Icons.refresh),
                              )
                            ],
                          ),
                          BoxContainer(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 140,
                                height: 140,
                                child: getIconVector(
                                    snapshot.data.currentlymodal.icon),
                              ),
                            ),
                          ),
                          BoxContainer(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                        (ftoC(snapshot.data.currentlymodal
                                                        .temperature)
                                                    .round())
                                                .toString() +
                                            "°C",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 32,
                                        ))
                                  ],
                                ),
                                Text(
                                    snapshot.data.currentlymodal.summary
                                        .toUpperCase(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            height: 120.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  snapshot.data.hourlymodal.datahourly.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                            readTimestampHourly(
                                                snapshot.data.hourlymodal
                                                    .datahourly[index].time,
                                                'MMM d'),
                                            style: TextStyle(
                                              fontSize: 14,
                                            )),
                                        Text(
                                            readTimestampHourly(
                                                snapshot.data.hourlymodal
                                                    .datahourly[index].time,
                                                'H:00'),
                                            style: TextStyle(
                                              fontSize: 14,
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                          child: Container(
                                            height: 30,
                                            child: getIconVector(snapshot
                                                .data
                                                .hourlymodal
                                                .datahourly[index]
                                                .icon),
                                          ),
                                        ),
                                        Text(
                                            (ftoC(snapshot
                                                            .data
                                                            .hourlymodal
                                                            .datahourly[index]
                                                            .temperature)
                                                        .round())
                                                    .toString() +
                                                "°C",
                                            style: TextStyle(
                                              fontSize: 14,
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            height: 160.0,
                            child: ListView.builder(
                              itemCount:
                                  snapshot.data.dailymodal.datadaily.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                            readTimestampHourly(
                                                snapshot.data.dailymodal
                                                    .datadaily[index].time,
                                                'E, MMM d'),
                                            style: TextStyle(
                                              fontSize: 14,
                                            )),
                                        // Container(
                                        //   width: 180,
                                        //   child: new Column(
                                        //     children: <Widget>[
                                        //       Text(
                                        //     snapshot.data.dailymodal
                                        //         .datadaily[index].summary,
                                        //     style: TextStyle(
                                        //       fontSize: 14,
                                        //     )),
                                        //     ],
                                        //   ),
                                        // ),
                                        // Text(
                                        //     snapshot.data.dailymodal
                                        //         .datadaily[index].summary,
                                        //     style: TextStyle(
                                        //       fontSize: 14,
                                        //     )),
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0, bottom: 8.0),
                                              child: Container(
                                                height: 24,
                                                child: getIconVector(snapshot
                                                    .data
                                                    .dailymodal
                                                    .datadaily[index]
                                                    .icon),
                                              ),
                                            ),
                                            Text(
                                                (ftoC(snapshot
                                                                .data
                                                                .dailymodal
                                                                .datadaily[
                                                                    index]
                                                                .temperatureMin)
                                                            .round())
                                                        .toString() +
                                                    "°/ " +
                                                    (ftoC(snapshot
                                                                .data
                                                                .dailymodal
                                                                .datadaily[
                                                                    index]
                                                                .temperatureMax)
                                                            .round())
                                                        .toString() +
                                                    "°",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }));
  }
}

ftoC(dynamic f) {
  return (f - 32.0) * (5 / 9);
}

getIconVector(String iconString) {
  switch (iconString) {
    case "cloudy":
      {
        return SvgPicture.asset("assets/images/cloudy.svg");
      }
      break;

    case "rain":
      {
        return SvgPicture.asset("assets/images/rain.svg");
      }
      break;

    case "snow":
      {
        return SvgPicture.asset("assets/images/snow.svg");
      }
      break;

    case "sleet":
      {
        return SvgPicture.asset("assets/images/snow.svg");
      }
      break;

    case "fog":
      {
        return SvgPicture.asset("assets/images/foggy.svg");
      }
      break;

    case "wind":
      {
        return SvgPicture.asset("assets/images/wind.svg");
      }
      break;

    case "clear-day":
      {
        return SvgPicture.asset("assets/images/clear-day.svg");
      }
      break;

    case "clear-night":
      {
        return SvgPicture.asset("assets/images/clear-night.svg");
      }
      break;

    case "partly-cloudy-day":
      {
        return SvgPicture.asset("assets/images/partly-cloudy-day.svg");
      }
      break;

    case "partly-cloudy-night":
      {
        return SvgPicture.asset("assets/images/partly-cloudy-night.svg");
      }
      break;
  }
}
