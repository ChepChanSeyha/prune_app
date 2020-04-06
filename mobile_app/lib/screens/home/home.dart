import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'viewlist.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:50, bottom: 100),
              child: GestureDetector(
                onTap: (){
                  print("Clicked");
                },
                child: Center(
                  child: Text("Learning Subjects",
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            CustomTextField("Math",context),
            SizedBox(height: 25),
            CustomTextField("English",context),
            SizedBox(height: 25),
            CustomTextField('Geography',context),
            SizedBox(height: 25),
            CustomTextField('Khmer',context),
          ],
        ),
      ),
    );
  }
}
Widget CustomTextField(text, BuildContext context) {
  return GestureDetector(
    onTap: (){
      Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => ViewListScreen()
          )
      );
    },
    child: Container(
      height: MediaQuery.of(context).size.height/11,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: CupertinoTextField(
          onTap: (){
            print("Clicked");
          },
          enabled: false,
//          focusNode: FocusNod,
          placeholder: text,
          placeholderStyle: TextStyle(
              color: Colors.lightBlue
          ),
          style: TextStyle(
            color: Colors.lightBlue,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.lightBlue,
              width: 2,
            ),
          ),
        ),
      ),
    ),
  );
}
