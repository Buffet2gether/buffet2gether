import 'package:buffet2gether_home/pages/profile/profile_screen.dart';
import 'package:buffet2gether_home/services/auth.dart';
import 'package:flutter/material.dart';

class LoginAsTananett extends StatefulWidget {
  @override
  _LoginAsTananettState createState() => _LoginAsTananettState();
}

class _LoginAsTananettState extends State<LoginAsTananett> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: RaisedButton(
        onPressed: () async {
          dynamic result = await _auth.signInWithEmailAndPassword(
            '61010432@kmitl.ac.th',
            '123456',
          );
          /*dynamic result = await _auth.registerWithEmailAndPassword(
              '61010432@kmitl.ac.th',
              '123456',
              'tananett',
              'male',
              DateTime(1999, 6, 27));*/
          print(result.userId);
          if (result == null) {
            print('error');
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => ProfileScreen()));
          }
        },
      ),
    );
  }
}
