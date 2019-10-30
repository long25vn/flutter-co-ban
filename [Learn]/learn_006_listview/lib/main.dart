import 'package:flutter/material.dart';
import 'package:listview/models/src/weather.dart';
import 'package:listview/models/src/app_settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          for (var i = 0; i <= 100; i++)
            Container(
              height: 100,
              color: Colors.amber[600],
              child: Text(
                i.toString(),
                style: TextStyle(fontSize: 32),
              ),
            )
        ],
      ),
      // body: ListView.builder(
      //   shrinkWrap: true,
      //     itemCount: 10000,
      //     itemExtent: 50.0,
      //     itemBuilder: (BuildContext context, int index) {
      //       return ListTile(title: Text("$index"));
      //     }),

      // body: GridView.count(
      //   crossAxisCount: 4,
      //   children: new List<Widget>.generate(16, (index) {
      //     return new GridTile(
      //       child: new Card(
      //           color: Colors.blue.shade200,
      //           child: new Center(
      //             child: new Text('tile $index'),
      //           )),
      //     );
      //   }),
      // ),

      //  body: GridView.count(
      //     crossAxisCount: 3,
      //     children: List.generate(choices.length, (index) {
      //         return Center(
      //           child: ChoiceCard(choice: choices[index]),
      //         );
      //      }
      //     )
      //   ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
        return Card(
          color: Colors.white,
          child: Center(child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Icon(choice.icon, size:90.0, color: textStyle.color)),
                Text(choice.title, style: textStyle),
          ]
        ),
      )
    );
  }
}


class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.drafts),
  const Choice(title: 'Boat', icon: Icons.dvr),
  const Choice(title: 'Bus', icon: Icons.copyright),
  const Choice(title: 'Train', icon: Icons.cloud_off),
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.drafts),
  const Choice(title: 'Boat', icon: Icons.dvr),
  const Choice(title: 'Bus', icon: Icons.copyright),
  const Choice(title: 'Train', icon: Icons.cloud_off),
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.drafts),
  const Choice(title: 'Boat', icon: Icons.dvr),
  const Choice(title: 'Bus', icon: Icons.copyright),
  const Choice(title: 'Train', icon: Icons.cloud_off),
];
