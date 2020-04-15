import 'package:buffet2gether_home/pages/home_page.dart';
import 'package:buffet2gether_home/screens/home/authenticate.dart';
import 'package:buffet2gether_home/pages/createAccount_page.dart';
import 'package:buffet2gether_home/pages/login_page.dart';
import 'package:buffet2gether_home/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    print("user is $user");
    // return either the Home or Authenticate widget
    if (user == null){
      return Login();
    } else {
      return HomeColumn();
    }
    
  }
}