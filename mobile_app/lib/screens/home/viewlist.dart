import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prune_app/screens/home/view.dart';
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
          ItemListView(_controller, context),
          SizedBox(height:20 ,),
          ItemListView(_controller,context),
          ItemListView(_controller,context),
        ],
      ),
    );
  }
}
Widget ItemListView (_controller, BuildContext context) {
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
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  child: Icon(Icons.account_circle, size: 60, color: Colors.lightBlue,),
                ),
                Text("Teacher A",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.lightBlue
                ),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("1h ago", style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 16
              ),),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 15),
          child: Text("This is the vedio of the teacher ""A that is the most powerful teacher that i never know",
            style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 16
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 15, top: 15),
                  child: Icon(Icons.favorite,color: Colors.lightBlue,),
                ),
                Text("1k" ,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 15, top: 15),
                  child: Icon(Icons.indeterminate_check_box,color: Colors.lightBlue,),
                ),
                Text("250" ,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => ViewScreen()
                      )
                  );
                },
                child: Text("TEST",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                ),
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}