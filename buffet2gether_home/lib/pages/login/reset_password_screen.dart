import 'package:buffet2gether_home/models/profile_model.dart';
import 'package:buffet2gether_home/services/auth.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      body: SafeArea(
          child: StreamBuilder<UserData>(
              stream: DatabaseService(uid: user.userId).userData,
              builder: (context, snapshot) {
                UserData userData = snapshot.data;
                return ListView(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Edit Password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(height: 10),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.idCard,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      'Current Password',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 17,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              TextFormField(
                                maxLength: 10,
                                obscureText: true,
                                decoration: InputDecoration(
                                    counterText: "",
                                    isDense: true,
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[200]),
                                //initialValue: userData.name,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your password.';
                                  }

                                  return null;
                                },
                                onSaved: (String value) {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              })),
    );
  }
}