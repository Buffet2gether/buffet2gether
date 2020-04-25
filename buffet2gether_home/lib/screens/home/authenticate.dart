
import 'package:flutter/material.dart';
import 'package:buffet2gether_home/pages/login/login_page.dart';
import 'package:buffet2gether_home/pages/login/createAccount_page.dart';



class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  
  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);

  }


  @override
  Widget build(BuildContext context) {
    if (showSignIn){
      return Login();
    }
    else{
      return SignUp();
    }
  }
}