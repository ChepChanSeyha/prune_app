import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:prune_app/screens/home/test.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                onReady: () {
                  print('Player is ready.');
                },
                onEnded: (data) {
                  createDialog(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: Text("Teacher A",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.red
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("10,200,500 views", style: TextStyle(
                    fontSize: 16,
                    color: Colors.red
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 15, top: 15),
                child: Text("This is the vedio of the teacher ""A that is the most powerful teacher that i never know",
                  style: TextStyle(fontSize: 16,   color: Colors.red),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 15, top: 15,right:5),
                        child: Icon(Icons.thumb_up,color: Colors.red,),
                      ),
                      Text("1k" ,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 15, top: 15,right:5),
                        child: Icon(Icons.thumb_down,color: Colors.red,),
                      ),
                      Text("200" ,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                      ),
                      ),
                    ],
                  ),
                ],
              ),
              Center(
                child: ButtonTheme(
                  minWidth: 300.0,
                  height: 50.0,
                  buttonColor: Colors.red,
                  child: RaisedButton(
                      onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(builder: (context) => TestScreen()
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
              ),
            ],
          ),
        )
    );
  }
}

createDialog( BuildContext context){
  return showDialog(context: context, builder: (context){
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
        title: Center(
            child: Text('Get Points', style: TextStyle(color: Colors.red),
            )
        ),
        content: SingleChildScrollView(
          child: Container(
            height: 350.0,
            width: 300.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
             Padding(
                padding: EdgeInsets.only(right: 15, left: 15 , top: 140),
                child: Text(
                '50 Points',
                style: TextStyle(color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
              ),
             ),
              Padding(
                 padding: const EdgeInsets.only(left: 10, right: 10, top: 120),
                child: RaisedButton(
                color: Colors.red,
                onPressed: () {
                Navigator.of(context).pop();
              },
                 child: Text(
                 'Okay',
                   style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
             )
          ]
        ),
      ),
     ),
    );
  });
}