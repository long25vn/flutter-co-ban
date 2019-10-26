import 'package:flutter/material.dart';
import 'package:weather/widgets/box_container.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/screens/current.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
      ),
      home: MyHomePage(title: 'Thời tiết'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Thời tiết hiện tại');
  String _searchText = "";
  final TextEditingController _filter = new TextEditingController();
  List filteredNames = new List();
  List names = new List();
  Future<Post> post;

  @override
  void initState() {
    super.initState();
    post = fetchPost();
    print("post");
    print(post);
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
            fillColor: Colors.white70,
            hoverColor: Colors.white70,
            hintText: 'Nhập từ khóa...',
            hintStyle: TextStyle(
              color: Colors.white70,
              decorationColor: Colors.white70,
            ),
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Thời tiết hiện tại');
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: Current()),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

Future<Post> fetchPost() async {
  final response = await http.get(
      'https://api.darksky.net/forecast/5e78215b8ecd6da29dacd01bfcd7a1e0/10.34599,107.08426');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  final int id;
  final String timezone;
  final String body;

  Post({this.id, this.timezone, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      timezone: json['timezone'],
      body: json['body'],
    );
  }
}

class Response {
  final String timezone;
  CurrentlyModal currentlymodal;
  HourlyModal hourlymodal;
  DailyModal dailymodal;

  Response({this.timezone, this.hourlymodal, this.currentlymodal, this.dailymodal});
  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      timezone: json['timezone'],
      hourlymodal: HourlyModal.fromJson(json['hourly']),
      dailymodal: DailyModal.fromJson(json['daily']),
      currentlymodal: CurrentlyModal.fromJson(json['currently']),
    );
  }
}

class CurrentlyModal {
  final String summary;
  final String icon;
  final int time;
  final double temperature;

  CurrentlyModal({this.summary, this.time, this.icon, this.temperature});

  factory CurrentlyModal.fromJson(Map<String, dynamic> json) {
    return CurrentlyModal(
      time: json['time'],
      summary: json['summary'],
      icon: json['icon'],
      temperature: json['temperature'],
    );
  }
}

class HourlyModal {
  final String summary;
  final String icon;
  final List<DataHourly> datahourly;

  HourlyModal({this.summary, this.icon, this.datahourly});
  factory HourlyModal.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<DataHourly> datahourly = list.map((i) => DataHourly.fromJson(i)).toList();
    return HourlyModal(
      summary: json['summary'],
      datahourly: datahourly
    );
  }
}

class DailyModal {
  final String summary;
  final String icon;
  final List<DataDaily> datadaily;

  DailyModal({this.summary, this.icon, this.datadaily});
  factory DailyModal.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<DataDaily> datadaily = list.map((i) => DataDaily.fromJson(i)).toList();
    return DailyModal(
      summary: json['summary'],
      datadaily: datadaily
    );
  }
}

class DataHourly {
  final temperature;
  final String summary;
  final int time;
  final String icon;

  DataHourly({this.temperature, this.summary, this.time, this.icon});
  factory DataHourly.fromJson(Map<String, dynamic> json) {
    return DataHourly(
      summary: json['summary'],
      time: json['time'],
      icon: json['icon'],
      temperature: json['temperature'],
    );
  }
}


class DataDaily {
  final temperatureMin;
  final temperatureMax;
  final String summary;
  final int time;
  final String icon;

  DataDaily({this.temperatureMin, this.temperatureMax, this.summary, this.time, this.icon});
  factory DataDaily.fromJson(Map<String, dynamic> json) {
    return DataDaily(
      summary: json['summary'],
      time: json['time'],
      icon: json['icon'],
      temperatureMin: json['temperatureMin'],
      temperatureMax: json['temperatureMax'],
    );
  }
}