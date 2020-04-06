import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'screens/home/splashscreen.dart';
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
            primaryColor: Color(0xff5BBDF4)
        ),
        title: 'Prune',
        debugShowCheckedModeBanner: false,
        home: MySplashScreen(),
      ),
    );
  }
}
