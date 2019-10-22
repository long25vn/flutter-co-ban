# Flutter Youtube UI

## Sản phẩm
<p align="center">
  <img width="320" src="https://i.imgur.com/eLAc8o2.png">
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


## Thêm tag (tạm để hardcode 5 phần tử, dùng dữ liệu động List ở phần dưới)
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
  <img width="320" src="https://i.imgur.com/6Lg5IcD.png">
</p>


## Tạo layout widget Video

```dart
class Video extends StatelessWidget {
  Video(
      {this.videoThumbnail,
      this.channelAvatar,
      this.channelName,
      this.videoName,
      this.videoViews,
      this.videoTime,
      this.videoLength});

  final String videoThumbnail;
  final String channelAvatar;
  final String channelName;
  final String videoName;
  final String videoViews;
  final String videoTime;
  final String videoLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey,
          height: 220,
        ),
        Container(
          height: 80,
          child: Row(
            children: <Widget>[
              Container(
                width: 80,
                color: Colors.blueAccent,
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            width: 20,
                            height: 60,
                            color: Colors.deepPurple,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 60,
                          color: Colors.lime,
                        )
                      ],
                    ),
                    Container(
                      height: 20,
                      color: Colors.brown,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
```

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
        Expanded(
          child: ListView(
            children: <Widget>[
              Video(),
              Video(),
              Video(),
              Video(),
            ],
          ),
        ),
      ],
    );
  }
```

<p align="center">
  <img width="320" src="https://i.imgur.com/JC4YmPC.gif">
</p>

## Video và Tag dùng dữ liệu từ List (sử dụng dữ liệu động)



### Data Mockup
```dart
final List<dynamic> listVideo = [
  {
    "video_thumbnail": "https://futbolete.com/wp-content/uploads/2019/07/manchester-1.jpg",
    "channel_avatar": "https://i.imgur.com/s0WRUuu.png",
    "channel_name": "Cảm bóng đá",
    "video_name": "Đội hình Man Utd toàn thắng 6 trận vừa qua",
    "video_views": "45K",
    "video_time": "9 hours ago",
    "video_length": "5:00",
  },
. . .
```
[https://github.com/long25vn/flutter-co-ban/blob/master/%5BStepByStep%5DYoutubeUI/lib/data/data.dart](https://github.com/long25vn/flutter-co-ban/blob/master/%5BStepByStep%5DYoutubeUI/lib/data/data.dart)

### Tag Widget sử dụng dữ liệu động
[https://github.com/long25vn/flutter-co-ban/blob/master/%5BStepByStep%5DYoutubeUI/lib/widgets/tag.dart](https://github.com/long25vn/flutter-co-ban/blob/master/%5BStepByStep%5DYoutubeUI/lib/widgets/tag.dart)
```dart
class Tag extends StatelessWidget {
  Tag(
      {this.title,
      this.labelColor,
      this.backgroundColor,
      });

  final String title;
  final int labelColor;
  final int backgroundColor;

  @override
  Widget build(BuildContext context) {
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

### Video widget sử dụng dữ liệu động

[https://github.com/long25vn/flutter-co-ban/blob/master/%5BStepByStep%5DYoutubeUI/lib/widgets/video.dart](https://github.com/long25vn/flutter-co-ban/blob/master/%5BStepByStep%5DYoutubeUI/lib/widgets/video.dart)

## AppBar 

```dart
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
```
<p align="center">
  <img width="320" src="https://i.imgur.com/0n16bBZ.png">
</p>
