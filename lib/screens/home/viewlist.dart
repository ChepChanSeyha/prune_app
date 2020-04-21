import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prune_app/screens/home/view.dart';
import 'package:prune_app/screens/test/Test.dart';
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
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: Border.all(color: const Color(0xFFFFFFFF)),
        leading: CupertinoNavigationBarBackButton(
          color: Colors.red,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8,right: 8),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            itemListView(_controller, context),
            itemListView(_controller, context),
            itemListView(_controller, context),
          ],
        ),
      ),
    );
  }
}
Widget itemListView (_controller, BuildContext context) {
  return Column(
    children: <Widget>[
      GestureDetector(
        onTap:(){
          Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => ViewScreen()
              )
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.lightGreen,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                _createVideo(context, _controller),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                          child: Icon(Icons.account_circle, size: 60, color: Colors.red,),
                        ),
                        Text("Teacher A",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.red
                        ),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("1h ago", style: TextStyle(
                          color: Colors.red,
                          fontSize: 16
                      ),),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 15),
                  child: Text("This is the vedio of the teacher ""A that is the most powerful teacher that i never know",
                    style: TextStyle(
                        color: Colors.red,
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
                          child: Icon(Icons.favorite,color: Colors.red,),
                        ),
                        Text("1k" ,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 15, top: 15),
                          child: Icon(Icons.indeterminate_check_box,color: Colors.red,),
                        ),
                        Text("250" ,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                        ),
                      ],
                    ),
                  ],
                ),
                ButtonTheme(
                  minWidth: 300.0,
                  height: 50.0,
                  buttonColor: Colors.red,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => Test()
                          )
                      );
                    },
                    child: Text("TEST",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(height: 2,)
    ],
  );
}
Widget _createVideo(BuildContext context , _controller){
  return Container(
    height: MediaQuery.of(context).size.height/3,
    width: MediaQuery.of(context).size.width*1,
    child: Stack(
      children: <Widget>[
        Image.asset("assets/images/vedioPic.jpg"),
//        Center(
//          child: YoutubePlayer(
//            controller: _controller,
//            showVideoProgressIndicator: true,
//            onReady: () {
//              print('Player is ready.');
//            },
//            onEnded: (data) {
//              createDialog(context);
//            },
//          ),
//        ),
      ],
    ),
  );
}
