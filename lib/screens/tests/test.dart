import 'package:flutter/material.dart';
class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Test'),
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
