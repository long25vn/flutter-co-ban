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
  {
    "video_thumbnail": "https://i.ytimg.com/vi/Bt5X6vB5WaU/maxresdefault.jpg",
    "channel_avatar": "https://yt3.ggpht.com/a/AGF-l78e6VlF_mXKtdm_Tj86npxnk86WrFSqOHMq9g=s900-c-k-c0xffffffff-no-rj-mo",
    "channel_name": "TV HUB",
    "video_name": "Startup Gọi Vốn 7 Tỷ Để Dominate Thị Trường | Shark Tank Việt Nam Tập 12 | Mùa 3",
    "video_views": "45K",
    "video_time": "6 hours ago",
    "video_length": "18:06",
  },
    {
    "video_thumbnail": "https://i.ytimg.com/vi/mQG4bbs3JDk/hqdefault.jpg",
    "channel_avatar": "https://yt3.ggpht.com/a/AGF-l79IBcLBUvDLrRwU6jwf40IhEAF35TXaIuJ7-Q=s900-c-k-c0xffffffff-no-rj-mo",
    "channel_name": "XE HAY",
    "video_name": "Đánh giá chi tiết Mitsubishi #Xpander giá 550 triệu - CÓ ĐÁNG TIỀN? |XEHAY.VN|",
    "video_views": "109K",
    "video_time": "3 hours ago",
    "video_length": "12:01",
  },
];

class FakeDataVideo {
  static List<Widget> buildVideoData() {
    return listVideo.map((data) {
      return Video(
        videoThumbnail: data["video_thumbnail"],
        channelAvatar: data["channel_avatar"],
        channelName: data["channel_name"],
        videoName: data["video_name"],
        videoViews: data["video_views"],
        videoTime: data["video_time"],
        videoLength: data["video_length"],
      );
    }).toList();
  }
}


final List<dynamic> listTag = [
  {
    "title": "Home Design",
  },
  {
    "title": "Football",
  },
  {
    "title": "Flutter UI",
  },
  {
    "title": "Car Review",
  },
];

class FakeDataTag {
  static List<Widget> buildTagData() {
    List<Tag> lists = listTag.map((data) {
      return Tag(
        title: data["title"],
        backgroundColor: 0xFFF6F6F6,
        labelColor: 0xFF757575,
      );
    }).toList();
    lists.insert(0 ,Tag(title: "All", backgroundColor: 0xFF808080, labelColor: 0xFFFFFFFF));
    return lists;
  }
}

```
### Tag Widget sử dụng dữ liệu động

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

<p align="center">
  <img width="320" src="https://i.imgur.com/lc4BBxD.gif">
</p>

