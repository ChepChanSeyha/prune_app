import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prune_app/screens/tests/test.dart';
import 'package:prune_app/screens/wrapper.dart';
import 'models/user.dart';
import 'services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Color(0xffE91403)
        ),
        title: 'Fujiyama',
        debugShowCheckedModeBanner: false,
        home: Test(),
      ),
    );
  }
}
