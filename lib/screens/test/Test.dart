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
            color: Colors.red,
            child: Center(
              child: Text('Test1',style:TextStyle(color: Colors.white,fontSize: 24) ,),
            ),
          ),
          SizedBox(height: 10,),
          GestureDetector(
              onTap: (){
                final snackBar = SnackBar(content: Text("Tap A"),backgroundColor: Colors.red[300],);
                Scaffold.of(context).showSnackBar(snackBar);
                print(" A clicked");},
              child: new Container(
                width: 500.0,
                height: 68,
                color: Colors.white,
                child: Center(
                  child: Text('A',style:TextStyle(color: Colors.red))
                ),
              )
          ),
          SizedBox(height: 10,),
          GestureDetector(
              onTap: (){
                final snackBar = SnackBar(content: Text("Tap B"),backgroundColor: Colors.red[300],);
                Scaffold.of(context).showSnackBar(snackBar);
                print("B clicked");},
              child:  Container(
                width: 500.0,
                height: 68,
                color: Colors.white,
                child:  Center(
                  child: Text('B',style:TextStyle(color: Colors.red)),
                ),
              )
          ),
          SizedBox(height: 10,),
          GestureDetector(
              onTap: (){
                final snackBar = SnackBar(content: Text("Tap C"),backgroundColor: Colors.red[300],);
                Scaffold.of(context).showSnackBar(snackBar);
                print("C clicked");},
              child:  Container(
                width: 500.0,
                height: 68,
                color: Colors.white,
                child:  Center(
                  child: Text('C',style:TextStyle(color: Colors.red)),
                ),
              )
          ),
      // The GestureDetector wraps the button.

      ],
      ),

    );
  }
}
