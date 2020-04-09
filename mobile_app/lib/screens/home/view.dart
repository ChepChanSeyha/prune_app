import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ViewScreen extends StatefulWidget {
  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
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
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
          child: Column(
//
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                onReady: () {
                  print('Player is ready.');
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: Text("Teacher A",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.lightBlue
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("10,200,500 views", style: TextStyle(
                    fontSize: 16,
                    color: Colors.lightBlue
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 15, top: 15),
                child: Text("This is the vedio of the teacher ""A that is the most powerful teacher that i never know",
                  style: TextStyle(fontSize: 16,   color: Colors.lightBlue),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 15, top: 15,right:5),
                        child: Icon(Icons.thumb_up,color: Colors.lightBlue,),
                      ),
                      Text("1k" ,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 15, top: 15,right:5),
                        child: Icon(Icons.thumb_down,color: Colors.lightBlue,),
                      ),
                      Text("650" ,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue
                      ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("TEST",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue
                    ),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
    );
  }
}
