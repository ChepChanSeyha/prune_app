import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prune_app/screens/shared/my_flutter_app_icons.dart' as customIcons;
import 'home/explore.dart';
import 'home/home.dart';
import 'home/notification.dart';
import 'home/profile.dart';
import 'home/setting.dart';

class NavigetionTabBar extends StatefulWidget {
  @override
  _NavigetionTabBarState createState() => _NavigetionTabBarState();
}

class _NavigetionTabBarState extends State<NavigetionTabBar> {

  List<Widget> myPage=[
      Home(),
      NotificationScreen(),
      ExploreScreen(),
      ProfileScreen(),
      SettingScreen()
  ];

  Widget changeTitle( int index){
    switch (index){
      case 0: return Text("Feed");
      case 1: return Text("Notification");
      case 2: return Text("Explore");
      case 3: return Text("Profile");
      case 4: return Text("Setting");
    }
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        tabBuilder: (BuildContext context, currentIndex){
          return CupertinoTabView(
            builder: (context){
              return CupertinoPageScaffold(
                  child: myPage[currentIndex]
              );
            },
          );
        },
        tabBar: CupertinoTabBar(
//          backgroundColor: CupertinoColors.activeBlue,
          backgroundColor: Colors.lightBlue,
          activeColor: CupertinoColors.white,
          inactiveColor: Colors.grey[400],
          items: [
            BottomNavigationBarItem(
              icon:const Icon(customIcons.MyFlutterApp.view_quilt, size: 25,),
//                title: Text('Feed')
            ),
            BottomNavigationBarItem(
              icon: const Icon(customIcons.MyFlutterApp.notifications, size: 25),
//                title: Text('Notification')
            ),
            BottomNavigationBarItem(
              icon:const Icon(customIcons.MyFlutterApp.explore, size: 25),
//                title: Text('Explore')
            ),
            BottomNavigationBarItem(
              icon: const Icon(customIcons.MyFlutterApp.account_circle, size: 25),
//                title: Text('Profile')
            ),
            BottomNavigationBarItem(
              icon:const Icon(customIcons.MyFlutterApp.settings, size: 25),
//                title: Text('Setting')
            ),
          ],
        ),
      ),
    );
  }
}
