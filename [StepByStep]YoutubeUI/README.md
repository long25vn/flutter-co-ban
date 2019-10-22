# Flutter Youtube UI

## Mẫu
<p align="center">
  <img width="320" src="https://i.imgur.com/OdNbKkt.jpg">
</p>

-----

```dart

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Youtube"),
      ),
    );
  }
}
```

<p align="center">
  <img width="320" src="https://i.imgur.com/w6PhhBi.png">
</p>

```dart

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
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
        title: Text("Youtube"),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: BottomNavigationBar(
          onTap: tapBottomNavigationBar,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            buildBottomNavigationBarItem(Icons.home, "Home"),
            buildBottomNavigationBarItem(Icons.youtube_searched_for, "Trending"),
            buildBottomNavigationBarItem(Icons.subscriptions, "Subscriptions"),
            buildBottomNavigationBarItem(Icons.mail, "Inbox"),
            buildBottomNavigationBarItem(Icons.video_library, "Library"),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(IconData icon, String title) {
    return BottomNavigationBarItem(
          icon: Icon(icon),
          title: Text(title)
        );
  }
}
```

<p align="center">
  <img width="320" src="https://i.imgur.com/didhSft.png">
</p>

```dart

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
              children: <Widget>[
                chipTag("All", 0xFF808080, 0xFFFFFFFF),
                chipTag("Home Design", 0xFFF6F6F6, 0xFF757575),
                chipTag("Football", 0xFFF6F6F6, 0xFF757575),
                chipTag("Flutter UI", 0xFFF6F6F6, 0xFF757575),
                chipTag("Car Review", 0xFFF6F6F6, 0xFF757575),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Padding chipTag(String title, int backgroundColor, int labelColor) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      child: FilterChip(
        label: Text(title),
        labelStyle: TextStyle(color: Color(labelColor)),
        backgroundColor: Color(backgroundColor),
        shape: StadiumBorder(
            side: BorderSide(
          color: Color(0xFFCECECE),
          width: 0.5,
        )),
        onSelected: (bool value) {},
      ),
    );
  }
}
```
<p align="center">
  <img width="320" src="https://i.imgur.com/nqTl7S1.png">
</p>

