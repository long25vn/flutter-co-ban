// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     title: 'Named Routes Demo',
//     // Start the app with the "/" named route. In this case, the app starts
//     // on the FirstScreen widget.
//     initialRoute: '/',
//     routes: {
//       // When navigating to the "/" route, build the FirstScreen widget.
//       '/': (context) => FirstScreen(),
//       // When navigating to the "/second" route, build the SecondScreen widget.
//       '/second': (context) => SecondScreen(),
//       '/third': (context) => ThirdScreen()
//     },
//   ));
// }

// class FirstScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('First Screen'),
//       ),
//       body: Center(
//         child: RaisedButton(
//           child: Text('Launch screen'),
//           onPressed: () {
//             // Navigate to the second screen using a named route.
//             Navigator.pushNamed(context, '/second');
//           },
//         ),
//       ),
//     );
//   }
// }

// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Second Screen"),
//       ),
//       body: Center(
//         child: RaisedButton(
//           onPressed: () {
//             // Navigate back to the first screen by popping the current route
//             // off the stack.
//             Navigator.pushNamed(context, '/third');
//           },
//           child: Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }

// class ThirdScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Third Screen"),
//       ),
//       body: Center(
//         child: RaisedButton(
//           onPressed: () {
//             // Navigate back to the first screen by popping the current route
//             // off the stack.
//             Navigator.pop(context, '/');
//           },
//           child: Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Initially display FirstPage
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'First Page',
              style: TextStyle(fontSize: 50),
            ),
            RaisedButton(
              child: Text('Go to second'),
              onPressed: () {
                // Pushing a route directly, WITHOUT using a named route
                Navigator.of(context).push(
                  // With MaterialPageRoute, you can pass data between pages,
                  // but if you have a more complex app, you will quickly get lost.
                  MaterialPageRoute(
                    builder: (context) =>
                        SecondPage(data: 'Hello there from the first page!'),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  // This is a String for the sake of an example.
  // You can use any type you want.
  final String data;

  SecondPage({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Second Page',
              style: TextStyle(fontSize: 50),
            ),
            Text(
              data,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}