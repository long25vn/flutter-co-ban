import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
        ConstrainedBox(
          constraints: BoxConstraints.tight(Size(double.infinity, 220)),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Positioned(
                  top: 0.0,
                  child: Container(
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(videoThumbnail),
                          fit: BoxFit.cover,
                        ),
                      ))),
              Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                      decoration: new BoxDecoration(
                          color: Color(0xFF464646),
                          borderRadius: new BorderRadius.all(Radius.circular(4.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: AutoSizeText(
                          videoLength,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                          maxLines: 1,
                        ),
                      ))),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          height: 80,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                child: Container(
                    padding: EdgeInsets.all(26.0),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(channelAvatar),
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12.0, right: 12.0, top: 12.0),
                            child: Container(
                              child: AutoSizeText(
                                videoName,
                                style: TextStyle(fontSize: 16),
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            height: 40,
                            child:
                                Icon(Icons.more_vert, color: Color(0xFF757575)),
                          ),
                        )
                      ],
                    ),
                    Container(
                        child: Row(
                      children: <Widget>[
                        buildPadding(channelName),
                        buildPadding(videoViews + " views"),
                        buildPadding(videoTime),
                      ],
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Padding buildPadding(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: AutoSizeText(
        title,
        style: TextStyle(fontSize: 14, color: Color(0xFF757575)),
        maxLines: 2,
      ),
    );
  }
}
