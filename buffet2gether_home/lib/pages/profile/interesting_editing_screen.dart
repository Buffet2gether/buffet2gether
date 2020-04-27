import 'package:buffet2gether_home/models/profile_model.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class InterestingEditingScreen extends StatefulWidget {
  @override
  _InterestingEditingScreenState createState() =>
      _InterestingEditingScreenState();
}

class _InterestingEditingScreenState extends State<InterestingEditingScreen> {
  bool _tempFashion;
  bool _tempSport;
  bool _tempTechnology;
  bool _tempPolitic;
  bool _tempEntertainment;
  bool _tempBook;
  bool _tempPet;
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
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Interesting',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      SwitchListTile(
                        title: Text('Fashion'),
                        value: _tempFashion ?? userData.fashion,
                        secondary: Icon(
                          FontAwesomeIcons.hatCowboySide,
                          color: Theme.of(context).primaryColor,
                        ),
                        onChanged: (bool value) {
                          setState(() {
                            _tempFashion = value;
                            //print(_tempFashion);
                          });
                        },
                      ),
                      SwitchListTile(
                        title: Text('Sport'),
                        value: _tempSport ?? userData.sport,
                        secondary: Icon(
                          FontAwesomeIcons.footballBall,
                          color: Theme.of(context).primaryColor,
                        ),
                        onChanged: (bool value) {
                          setState(() {
                            _tempSport = value;
                          });
                        },
                      ),
                      SwitchListTile(
                        title: Text('Technology'),
                        value: _tempTechnology ?? userData.technology,
                        secondary: Icon(
                          FontAwesomeIcons.laptop,
                          color: Theme.of(context).primaryColor,
                        ),
                        onChanged: (bool value) {
                          setState(() {
                            _tempTechnology = value;
                          });
                        },
                      ),
                      SwitchListTile(
                        title: Text('Politic'),
                        value: _tempPolitic ?? userData.politic,
                        secondary: Icon(
                          FontAwesomeIcons.balanceScale,
                          color: Theme.of(context).primaryColor,
                        ),
                        onChanged: (bool value) {
                          setState(() {
                            _tempPolitic = value;
                          });
                        },
                      ),
                      SwitchListTile(
                        title: Text('Entertainment'),
                        value: _tempEntertainment ?? userData.entertainment,
                        secondary: Icon(
                          FontAwesomeIcons.dice,
                          color: Theme.of(context).primaryColor,
                        ),
                        onChanged: (bool value) {
                          setState(() {
                            _tempEntertainment = value;
                          });
                        },
                      ),
                      SwitchListTile(
                        title: Text('Book'),
                        value: _tempBook ?? userData.book,
                        secondary: Icon(
                          FontAwesomeIcons.book,
                          color: Theme.of(context).primaryColor,
                        ),
                        onChanged: (bool value) {
                          setState(() {
                            _tempBook = value;
                          });
                        },
                      ),
                      SwitchListTile(
                        title: Text('Pet'),
                        value: _tempPet ?? userData.pet,
                        secondary: Icon(
                          FontAwesomeIcons.cat,
                          color: Theme.of(context).primaryColor,
                        ),
                        onChanged: (bool value) {
                          setState(() {
                            _tempPet = value;
                          });
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          OutlineButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Text(
                              'Cancle',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {
                              _tempFashion = userData.fashion;
                              _tempSport = userData.sport;
                              _tempTechnology = userData.technology;
                              _tempPolitic = userData.politic;
                              _tempEntertainment = userData.entertainment;
                              _tempBook = userData.book;
                              _tempPet = userData.pet;
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(width: 10),
                          OutlineButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            onPressed: () async {
                              //print(_tempFashion);
                              await DatabaseService(uid: user.userId)
                                  .updateUserDataInteresting(
                                  _tempFashion ?? userData.fashion,
                                  _tempSport ?? userData.sport,
                                  _tempTechnology ?? userData.technology,
                                  _tempPolitic ?? userData.politic,
                                  _tempEntertainment ??
                                      userData.entertainment,
                                  _tempBook ?? userData.book,
                                  _tempPet ?? userData.pet);

                              Navigator.pop(context);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
