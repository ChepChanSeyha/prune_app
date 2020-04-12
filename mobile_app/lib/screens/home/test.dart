import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}
class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
       leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.pop(context),
         ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10,),
          Container(
            height: 68,
            color: Colors.blue,
            child: Center(
              child: Text('Test1',style:TextStyle(color: Colors.white) ,),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 68,
            color: Colors.white,
            child: Center(
              child: Text('A',style:TextStyle(color: Colors.blue)),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 68,
            color: Colors.white,
            child: Center(
              child: Text('B',style:TextStyle(color: Colors.blue)),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 68,
            color: Colors.white,
            child: Center(
              child: Text('C',style:TextStyle(color: Colors.blue)),
            ),
          ),
        ],
      ),
    );
  }
}