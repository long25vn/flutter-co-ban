import 'package:flutter/material.dart';
import 'package:youtube_ui/main.dart';
import 'package:youtube_ui/screens/home_tab.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  void tapBottomNavigationBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Youtube", style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.videocam,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://ssl.gstatic.com/images/branding/product/1x/avatar_circle_blue_512dp.png"),
                    fit: BoxFit.cover,
                  ),
                )),
          )
        ],
      ),
      body: Container(
        child: HomeTab(),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: BottomNavigationBar(
          onTap: tapBottomNavigationBar,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            buildBottomNavigationBarItem(Icons.home, "Home"),
            buildBottomNavigationBarItem(
                Icons.youtube_searched_for, "Trending"),
            buildBottomNavigationBarItem(Icons.subscriptions, "Subscriptions"),
            buildBottomNavigationBarItem(Icons.mail, "Inbox"),
            buildBottomNavigationBarItem(Icons.video_library, "Library"),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      IconData icon, String title) {
    return BottomNavigationBarItem(icon: Icon(icon), title: Text(title));
  }
}
