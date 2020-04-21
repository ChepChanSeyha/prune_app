import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/loading.dart';
import '../../shared/charts.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser currentUser;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  void _loadCurrentUser() {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
      setState(() {
        this.currentUser = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var dpc = DatumLegendWithMeasures.withSampleData();

    return loading
        ? Loading()
        : Scaffold(
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
                      color: Colors.red,
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
                    height: MediaQuery.of(context).size.width / 2.5,
                    child: Image.asset('assets/images/image.png',
                        fit: BoxFit.fitHeight, alignment: Alignment.center),
                  ),
                  Container(
                    color: Colors.redAccent,
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.width / 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                child: currentUser != null
                                    ? Container(
                                        child: StreamBuilder<DocumentSnapshot>(
                                          stream: Firestore.instance
                                              .collection('users')
                                              .document(currentUser.uid)
                                              .snapshots(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<DocumentSnapshot>
                                                  snapshot) {
                                            if (snapshot.hasError) {
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            } else if (snapshot.hasData) {
                                              return userInfo(snapshot.data);
                                            }
                                            return LinearProgressIndicator();
                                          },
                                        ),
                                      )
                                    : Center(
                                        child: CircularProgressIndicator(),
                                      )),
                          ],
                        ),
                        ButtonTheme(
                          height: 50.0,
                          minWidth: 100.0,
                          child: RaisedButton(
                            child: Text('EDIT'),
                            onPressed: () {},
                            textColor: Colors.white,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Learning history',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Container(
//                    color: Colors.blue,
                          height: MediaQuery.of(context).size.width * 0.5,
                          width: MediaQuery.of(context).size.width * 1,
                          child: dpc,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

Widget userInfo(DocumentSnapshot snapshot) {
  if (snapshot.data == null) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Null', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
        Text('Null', style: TextStyle(fontSize: 16),)
      ],
    );
  } else {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(snapshot.data['fullName'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
        Text(snapshot.data['location'], style: TextStyle(fontSize: 16),)
      ],
    );
  }
}
