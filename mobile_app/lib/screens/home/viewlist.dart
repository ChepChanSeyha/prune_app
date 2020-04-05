import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ViewListScreen extends StatefulWidget {
  @override
  _ViewListScreenState createState() => _ViewListScreenState();
}

class _ViewListScreenState extends State<ViewListScreen> {
  YoutubePlayerController _controller;
  @override
  void initState(){
    _controller = YoutubePlayerController(
      initialVideoId: 'cWZDLHUK3x0',
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay:false,
      ),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: Border.all(color: const Color(0xFFFFFFFF)),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ItemListView(_controller),
          SizedBox(height:20 ,),
          ItemListView(_controller),
          ItemListView(_controller),
        ],
      ),
    );
  }
}
Widget ItemListView (_controller) {
  return Container(
    child: Column(
      children: <Widget>[
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () {
            print('Player is ready.');
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(Icons.account_circle, size: 50,),
                ),
                Text("Teacher A"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("1h ago"),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 15),
          child: Text("This is the vedio of the teacher ""A that is the most powerful teacher that i never know"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(Icons.favorite,),
                ),
                Text("1k"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("TEST"),
            )
          ],
        ),
      ],
    ),
  );
}