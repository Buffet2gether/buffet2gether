import 'dart:ui';
import 'package:buffet2gether_home/models/profile_model.dart';
import 'package:buffet2gether_home/pages/profile/profile_setting_screen.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:buffet2gether_home/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:buffet2gether_home/services/auth.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final maleIcon = FontAwesomeIcons.male;
  final femaleIcon = FontAwesomeIcons.female;
  int isSelecting = 0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    var currentUser = FirebaseAuth.instance.currentUser();
    return Scaffold(
      body: SafeArea(
          child: StreamBuilder<UserData>(
              stream: DatabaseService(uid: user?.userId).userData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  UserData userData = snapshot.data;
                  print(userData.userId);
                  return ListView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            height: 220,
                            width: 340,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: <Widget>[
                                Positioned(
                                  bottom: 10,
                                  child: Container(
                                    width: 340,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 5),
                                          blurRadius: 5.0,
                                          spreadRadius: 2.0,
                                        ),
                                      ],
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                      //color: Colors.grey[300],
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              print('Tag Pressed');
                                              setState(() {
                                                isSelecting = 0;
                                              });
                                            },
                                            child: Container(
                                                width: 169.5,
                                                height: 110,
                                                padding:
                                                EdgeInsets.only(top: 70),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    topLeft:
                                                    Radius.circular(10),
                                                    bottomLeft:
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: Text(
                                                  'Tag',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      letterSpacing: 2,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                  textAlign: TextAlign.center,
                                                )),
                                          ),
                                          SizedBox(width: 1),
                                          InkWell(
                                            onTap: () {
                                              print('History Pressed');
                                              setState(() {
                                                isSelecting = 1;
                                              });
                                            },
                                            child: Container(
                                                width: 169.5,
                                                height: 110,
                                                padding:
                                                EdgeInsets.only(top: 70),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    topRight:
                                                    Radius.circular(10),
                                                    bottomRight:
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: Text(
                                                  'History',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      letterSpacing: 2,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                  textAlign: TextAlign.center,
                                                )),
                                          ),
                                        ]),
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      width: 320,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0, 5),
                                            blurRadius: 5.0,
                                            spreadRadius: 2.0,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Container(
                                              width: 102,
                                              height: 102,
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                              child: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    userData.profilePicture),
                                                radius: 50,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    userData.name,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25.0,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        letterSpacing: 1),
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                        (DateTime.now()
                                                            .difference(
                                                            userData.dateofBirth)
                                                            .inDays /
                                                            365)
                                                            .floor()
                                                            .toString() +
                                                            ' | ',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          letterSpacing: 1,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      Icon(
                                                        userData.gender ==
                                                            'Male'
                                                            ? FontAwesomeIcons
                                                            .mars
                                                            : FontAwesomeIcons
                                                            .venus,
                                                        color: Colors.white,
                                                        size: 20,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                              padding: EdgeInsets.only(
                                                  bottom: 100, left: 5),
                                              icon: Icon(
                                                FontAwesomeIcons.cog,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                print('Settings pressed');
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                        StreamProvider<
                                                            User>.value(
                                                            value:
                                                            AuthService()
                                                                .user,
                                                            child:
                                                            ProfileSettingScreen())));
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Center(
                          child: Text(
                            '\' ' + userData.bio + ' \'',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      IndexedStack(
                          index: isSelecting,
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                ////////////////////////////////////////////////////Tag
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'You are interesting in : ',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        //height: 180,
                                        child: ListView.builder(
                                          physics: NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: 7,
                                          itemBuilder: (BuildContext context, int index)
                                          {
                                            if (index == 0 && userData.fashion == true) {
                                              return Container(
                                                margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black26,
                                                      offset: Offset(0, 2),
                                                      blurRadius: 0.5,
                                                      spreadRadius: 0.2,
                                                    ),
                                                  ],
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                                child: ListTile(
                                                  dense: true,
                                                  leading: Icon(
                                                    FontAwesomeIcons
                                                        .hatCowboySide,
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                  ),
                                                  title: Text(
                                                    'Fashion',
                                                    //overflow: TextOverflow.fade,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.0,
                                                      letterSpacing: 1,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            if (index == 1 && userData.sport == true) {
                                              return Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 3, horizontal: 5),
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black26,
                                                      offset: Offset(0, 2),
                                                      blurRadius: 0.5,
                                                      spreadRadius: 0.2,
                                                    ),
                                                  ],
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                                child: ListTile(
                                                  dense: true,
                                                  leading: Icon(
                                                    FontAwesomeIcons
                                                        .footballBall,
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                  ),
                                                  title: Text(
                                                    'Sport',
                                                    //overflow: TextOverflow.fade,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.0,
                                                      letterSpacing: 1,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            if (index == 2 && userData.technology == true) {
                                              return Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 3, horizontal: 5),
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black26,
                                                      offset: Offset(0, 2),
                                                      blurRadius: 0.5,
                                                      spreadRadius: 0.2,
                                                    ),
                                                  ],
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                                child: ListTile(
                                                  dense: true,
                                                  leading: Icon(
                                                    FontAwesomeIcons.laptop,
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                  ),
                                                  title: Text(
                                                    'Technology',
                                                    //overflow: TextOverflow.fade,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.0,
                                                      letterSpacing: 1,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            if (index == 3 && userData.politic == true) {
                                              return Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 3, horizontal: 5),
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black26,
                                                      offset: Offset(0, 2),
                                                      blurRadius: 0.5,
                                                      spreadRadius: 0.2,
                                                    ),
                                                  ],
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                                child: ListTile(
                                                  dense: true,
                                                  leading: Icon(
                                                    FontAwesomeIcons
                                                        .balanceScale,
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                  ),
                                                  title: Text(
                                                    'Politic',
                                                    //overflow: TextOverflow.fade,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.0,
                                                      letterSpacing: 1,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            if (index == 4 && userData.entertainment == true) {
                                              return Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 3, horizontal: 5),
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black26,
                                                      offset: Offset(0, 2),
                                                      blurRadius: 0.5,
                                                      spreadRadius: 0.2,
                                                    ),
                                                  ],
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                                child: ListTile(
                                                  dense: true,
                                                  leading: Icon(
                                                    FontAwesomeIcons.dice,
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                  ),
                                                  title: Text(
                                                    'Entertainment',
                                                    //overflow: TextOverflow.fade,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.0,
                                                      letterSpacing: 1,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            if (index == 5 && userData.book == true) {
                                              return Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 3, horizontal: 5),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black26,
                                                      offset: Offset(0, 2),
                                                      blurRadius: 0.5,
                                                      spreadRadius: 0.2,
                                                    ),
                                                  ],
                                                ),
                                                child: ListTile(
                                                  dense: true,
                                                  leading: Icon(
                                                    FontAwesomeIcons.book,
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                  ),
                                                  title: Text(
                                                    'Book',
                                                    //overflow: TextOverflow.fade,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.0,
                                                      letterSpacing: 1,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            if (index == 6 && userData.pet == true) {
                                              return Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 3, horizontal: 5),
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black26,
                                                      offset: Offset(0, 2),
                                                      blurRadius: 0.5,
                                                      spreadRadius: 0.2,
                                                    ),
                                                  ],
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                                child: ListTile(
                                                  dense: true,
                                                  leading: Icon(
                                                    FontAwesomeIcons.cat,
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                  ),
                                                  title: Text(
                                                    'Pet',
                                                    //overflow: TextOverflow.fade,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.0,
                                                      letterSpacing: 1,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            return SizedBox();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              /////////////////////////////////////////History
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              //color: Colors.blue,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  /*Text(
                                    'You haven\'t done anything yet.',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38,
                                    ),
                                  ),*/
                                  Text(
                                    'History : ',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    height: 150,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 5),
                                          blurRadius: 5.0,
                                          spreadRadius: 2.0,
                                        ),
                                      ],
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Image.network(
                                            'https://firebasestorage.googleapis.com/v0/b/buffet2gether.appspot.com/o/restaurantAndPromotion_pictures%2Frec1.png?alt=media&token=cab6b551-bb20-4f99-a945-1587047faf55',
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Ead Buffet Shabu',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    //fontWeight: FontWeight.bold,
                                                    letterSpacing: 0.5),
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                children: <Widget>[
                                                  Icon(
                                                    FontAwesomeIcons
                                                        .mapMarkerAlt,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    child: Text(
                                                      'This is the location of this restaurant',
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                children: <Widget>[
                                                  Icon(
                                                    FontAwesomeIcons.user,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    child: Text(
                                                      '4',
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ],
                  );
                } else {
                  if (snapshot.hasError) {
                    print(snapshot.error.toString());
                  }
                  return Loading();
                }
              })),
    );
  }
}
