import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

        width: MediaQuery.of(context).size.width*1,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:50, bottom: 100),
              child: Center(
                child: Text("Learning Subjects",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                ),
              ),
            ),
            StreamBuilder(
              stream: Firestore.instance.collection('categories').snapshots(),
              builder: (context, snapshot){
                if (!snapshot.hasData) return const Text("Loading...");
                return ListView.builder(
//                    itemExtent: 80,
                    shrinkWrap: true,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index)=>
                        _customTextField(context, snapshot.data.documents[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
Widget _customTextField(BuildContext context, DocumentSnapshot document) {
  return GestureDetector(
    onTap: (){
      Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => ViewListScreen()
          )
      );
    },
    child: Column(
      children: <Widget>[
        Container(
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
              placeholder: document['name'],
              placeholderStyle: TextStyle(
                color: Colors.red,
              ),
              style: TextStyle(
                color: Colors.red,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20,)
      ],
    ),

  );
}
