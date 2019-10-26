// import 'package:flutter/material.dart';
// import 'package:location/location.dart';

// class ListenPage extends StatefulWidget {
//   @override
//   _ListenPageState createState() => _ListenPageState();
// }

// class _ListenPageState extends State<ListenPage> {

//   Location location = Location();

//   Map<String, double> currentLocation;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     location.onLocationChanged().listen((value) {
//       setState(() {
//         currentLocation["latitude"] = value.latitude;
//         currentLocation["longitude"] = value.longitude;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: <Widget>[
//           currentLocation == null
//               ? CircularProgressIndicator()
//               : Text("Location:" + currentLocation["latitude"].toString() + " " + currentLocation["longitude"].toString()),
//         ],
//       ),
//     );
//   }
// }