import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import '../wrapper.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 14,
        navigateAfterSeconds: Wrapper(),
        backgroundColor: Colors.transparent,
        imageBackground: AssetImage('assets/images/background.jpg'),
        photoSize: 100.0,
        loaderColor: Colors.transparent
    );
  }
}
