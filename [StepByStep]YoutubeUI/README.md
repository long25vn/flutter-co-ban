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
