import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: Border.all(color: const Color(0xFFFFFFFF)),
        leading: CupertinoNavigationBarBackButton(
          color: Colors.red,
          onPressed: () => Navigator.pop(context),
        ),
      ),
//        title: Text('Test'),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10,),
          Container(
            height: 68,
            color: Colors.red,
            child: Center(
              child: Text('Test1',style:TextStyle(color: Colors.white) ,),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 68,
            color: Colors.red[100],
            child: Center(
              child: Text('A',style:TextStyle(color: Colors.red)),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 68,
            color: Colors.red[100],
            child: Center(
              child: Text('B',style:TextStyle(color: Colors.red)),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 68,
            color: Colors.red[100],
            child: Center(
              child: Text('C',style:TextStyle(color: Colors.red)),
            ),
          ),

        ],
      ),

    );
  }
}
