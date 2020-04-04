import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Page'),
        actions: <Widget>[
          Icon(Icons.search)
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
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.width/2,
            child: Image.asset('assets/images/image.png', fit: BoxFit.fitHeight, alignment: Alignment.center),
          ),
          Container(
            color: Colors.blue[100],
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.width/3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Makara Dae', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
