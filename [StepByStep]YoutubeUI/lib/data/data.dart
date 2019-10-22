import 'package:flutter/material.dart';
import 'package:youtube_ui/widgets/video.dart';
import 'package:youtube_ui/widgets/tag.dart';

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
