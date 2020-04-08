import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/loading.dart';
import 'charts.dart';

class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool loading = false;

  @override
  Widget build(BuildContext context) {

    var dpc = DatumLegendWithMeasures.withSampleData();

    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Page'),
        actions: <Widget>[
//          Icon(Icons.search),
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff5BBDF4),
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.width/2.5,
              child: Image.asset('assets/images/image.png', fit: BoxFit.fitHeight, alignment: Alignment.center),
            ),
            Container(
              color: Colors.blue[100],
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.width/3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Chep Chanseyha', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                      Text('Phnom Penh, Cambodia'),
                    ],
                  ),
                  ButtonTheme(
                    height: 50.0,
                    minWidth: 100.0,
                    child: RaisedButton(
                      child: Text('EDIT'),
                      onPressed: () {},
                      textColor: Colors.white,
                      color: Color(0xff5BBDF4),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text('Learning history', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                      ),
                      Center(
                        child: Container(
                          //color: Colors.blue,
                          height: 350.0,
                          width: 350.0,
                          child: dpc,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
