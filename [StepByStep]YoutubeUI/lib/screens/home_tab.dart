import 'package:flutter/material.dart';
import 'package:youtube_ui/data/data.dart';

class HomeTab extends StatefulWidget {
  HomeTab();
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFC4C4C4),
              width: 0.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: FakeDataTag.buildTagData(),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: FakeDataVideo.buildVideoData(),
          ),
        ),
      ],
    );
  }
}
