import 'package:buffet2gether_home/services/auth.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final Firestore _fireStore = Firestore.instance;
DatabaseService database = new DatabaseService();

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Buffet2gether'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
          icon: Icon(Icons.person),
          label:  Text('logout'),
          onPressed: () async {
              await _auth.signOut();

          },
          )
        ],
      ),
      body: RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Print',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async{
                      
                      }
        ),
      
    );
  }
}