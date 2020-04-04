import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prune_app/models/user.dart';
<<<<<<< HEAD
import 'package:prune_app/screens/profile/profile.dart';

=======
import 'package:prune_app/screens/navigetionbar.dart';
>>>>>>> origin/sokhom
import 'authenticate/authenticate.dart';
import 'home/home.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    
    if(user != null) {
      return Authenticate();
    } else {
<<<<<<< HEAD
      return Profile();
=======
      return NavigetionTabBar();
>>>>>>> origin/sokhom
    }

  }
}
