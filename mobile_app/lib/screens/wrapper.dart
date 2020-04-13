import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import 'authenticate/authenticate.dart';
import 'navigetionbar.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    
    if(user == null) {
      return Authenticate();
    } else {
      return NavigationTabBar();
    }

  }
}
