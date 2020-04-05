import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prune_app/models/user.dart';
import 'package:prune_app/screens/navigetionbar.dart';
import 'authenticate/authenticate.dart';
import 'home/home.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    
    if(user == null) {
      return Authenticate();
    } else {
      return NavigetionTabBar();
    }

  }
}
